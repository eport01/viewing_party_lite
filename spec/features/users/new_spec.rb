require "rails_helper"


RSpec.describe("New Register Page") do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    visit("/register")
  end

  describe("when i vist root_path theres a link to create a new register") do
    describe("When I click on the link it takes me a to a form to create a new item") do
      it("the form has fields for name and email,when i click submit im redirected back to /users/:id where i see the new register") do
        expect(page).to(have_field("Name"))
        expect(page).to(have_field("Email"))
        fill_in("Name",         with: "Milo")
        fill_in("Email",         with: "MilosMurphyslaw@gmail.com")
        fill_in :password, with: "thisisatest"
        fill_in :password_confirmation, with: "thisisatest"

        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to eq(user_path(new_user))
      end
    end

    describe 'sad path testing' do 
      it 'shows a flash message when a user enters a username thats already been used' do 
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith@gmail.com")
        fill_in :password, with: "thisisatest"
        fill_in :password_confirmation, with: "thisisatest"
        click_on("Create New User")
        expect(page).to have_content("Passwords need to match")
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith2@gmail.com")
        fill_in :password, with: "thisisatest"
        fill_in :password_confirmation, with: "thisisatest"
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to eq(user_path(new_user))
      end
    end

    describe 'I see a form to fill in name, email, password, and password conf' do
      it 'can create new user and bring back to user dashboard' do 
        fill_in :name, with: "Emily"
        fill_in :email, with: "test@gmail.com"
        fill_in :password, with: "testing123"
        fill_in :password_confirmation, with: "testing123"
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to eq(user_path(new_user))
        expect(page).to have_content("welcome Emily")
      end

    end

    describe 'if i fail to fill in name, unique email, or matching password' do 
      it 'im taken back to register page with error message' do 
        fill_in :name, with: "Emily"
        fill_in :email, with: "test@gmail.com"
        fill_in :password, with: "testing123"
        fill_in :password_confirmation, with: "testing321"
        click_on("Create New User")
        expect(current_path).to eq(register_path)
        expect(page).to have_content("Passwords need to match")

      end
    end
  end
end
