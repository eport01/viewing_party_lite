require "rails_helper"


RSpec.describe("Welcome Index Page") do
  before(:each) do
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')

    visit(root_path)
  end

  describe("When I visit /") do
    describe("Then I see") do
      it("the project repo name") do
        expect(page).to(have_content("Viewing Party"))
      end

      it("link to back to root") do
        expect(page).to(have_link("Home"))
        expect(current_path).to(eq(root_path))
      end

      it("A button to create a New User") do
        within("#creation") do
          expect(page).to(have_button("Create New User"))
          click_button("Create New User")
          expect(current_path).to(eq("/register"))
        end
      end
    end
  end

  describe 'on landing page as a visitor' do 
    it 'when i click on dashboard button, i remain on landing page and i see an error message' do 
      expect(page).to_not have_content("Existing Users")
      expect(page).to have_button "Dashboard"
      click_button "Dashboard"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in or registered to access your dashboard")
       
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@mary)
      visit root_path 

      click_button "Dashboard"
      
      expect(current_path).to eq(user_path(@mary))
      click_link "Home"
      expect(page).to have_content("Existing Users")
      expect(page).to_not have_content("You must be logged in or registered to access your dashboard")


    end

    it 'i see buttons to create user and login' do 
      expect(page).to have_button("Log In")
      expect(page).to have_button("Create New User")
      expect(page).to_not have_link("Log out")

    end
  end

  describe 'on landing page i see button to logout as a logged in user' do 
    it 'can logout' do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@mary)
      visit root_path 
      expect(page).to_not have_button("Log In")
      expect(page).to_not have_button("Create New User")
      click_link "Log out"
      expect(current_path).to eq(root_path)
    end
  end
end
