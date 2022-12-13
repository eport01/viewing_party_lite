require "rails_helper"


RSpec.describe("New Register Page") do
  before(:each) do
    @steve = User.create!(    name: "Steve",     email: "steve.smith@gmail.com",     password: "123test",     password_confirmation: "123test")
    @mary = User.create!(    name: "Mary",     email: "mary.smith@gmail.com",     password: "test123",     password_confirmation: "test123")
    visit("/register")
  end

  describe("when i vist root_path theres a linke to create a new register") do
    describe("When I click on the link it takes me a to a form to create a new item") do
      it("the form has fields for name and email,when i click submit im redirected back to /users/:id where i see the new register") do
        expect(page).to(have_field("Name"))
        expect(page).to(have_field("Email"))
        expect(page).to(have_field("Password"))
        fill_in("Name",         with: "Milo")
        fill_in("Email",         with: "MilosMurphyslaw@gmail.com")
        fill_in(:password,         with: "123test")
        fill_in(:password_confirmation,         with: "123test")
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to(eq(user_path(new_user)))
      end
    end

    describe("sad path testing") do
      it("shows a flash message when a user enters a username thats already been used") do
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith@gmail.com")
        click_on("Create New User")
        expect(page).to(have_content("Email has already been taken"))
        fill_in("Name",         with: "Mary")
        fill_in("Email",         with: "mary.smith2@gmail.com")
        fill_in(:password,         with: "test123")
        fill_in(:password_confirmation,         with: "test123")
        click_on("Create New User")
        new_user = User.last.id
        expect(current_path).to(eq(user_path(new_user)))
      end

      require "rails_helper"


      it("can log in with valid credentials") do
        user = User.create(        name: "funbucket13",         email: "EEE@email.com",         password: "test",         password_confirmation: "test")
        visit(login_path)
        fill_in(:email,         with: user.email)
        fill_in(:password,         with: user.password)
        click_on("Log In")
        expect(current_path).to(eq(user_path(user)))
        expect(page).to(have_content("Welcome back, #{user.name}!"))
      end
    end
  end
end
