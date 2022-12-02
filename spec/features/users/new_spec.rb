require "rails_helper"


RSpec.describe("New Register Page") do
  before(:each) do
    @steve = User.create!(    name: "Steve",     email: "steve.smith@gmail.com")
    @mary = User.create!(    name: "Mary",     email: "mary.smith@gmail.com")
    visit("/register")
  end

  describe("when i vist root_path theres a linke to create a new register") do
    describe("When I click on the link it takes me a to a form to create a new item") do
      it("the form has fields for name and email,when i click submit im redirected back to /users/:id where i see the new register") do
        expect(page).to(have_field("Name"))
        expect(page).to(have_field("Email"))
        fill_in("Name",         with: "Milo")
        fill_in("Email",         with: "MilosMurphyslaw@gmail.com")
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to eq(user_path(new_user))
      end
    end

    describe 'sad path testing' do 
      it 'shows a flash message when a user enters a username thats already been used' do 
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith@gmail.com")
        click_on("Create New User")
        expect(page).to have_content("Email has already been taken")
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith2@gmail.com")
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to eq(user_path(new_user))
      end
    end
  end
end
