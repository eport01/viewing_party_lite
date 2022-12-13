require "rails_helper"


RSpec.describe "Logging out" do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123', role: 0)
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432', role: 0)
  end

  describe 'after i login, when i visit landing page i dont see link for log in or create account' do 
    it 'i click log out and am taken to landing page and link is now for log in' do 
      visit root_path 
      click_on "Log In" 
      expect(current_path).to eq('/login')
      fill_in("Name",         with: "Mary")
      fill_in("Email",         with: "mary.smith@gmail.com")
      fill_in :password, with: "test432"
      fill_in :password_confirmation, with: "test432"

      click_on "Submit" 
      expect(current_path).to eq(user_path(@mary))
      click_on "Home"
      expect(page).to_not have_link "Log in"
      expect(page).to_not have_link "Create New User"

      expect(page).to have_link "Log out"
      click_on "Log out" 
      expect(current_path).to eq(root_path)
    end
  end

  describe 'as a visitor when i visit landing page' do 
    it 'i do not see section of page that lists existing users' do 
      visit root_path 
      expect(page).to_not have_content("Existing Users")
      expect(page).to_not have_content("steve.smith@gmail.com")
      expect(page).to_not have_content("mary.smith@gmail.com")

    end
  end

end