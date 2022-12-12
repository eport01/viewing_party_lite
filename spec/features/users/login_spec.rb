require "rails_helper"


RSpec.describe "Logging in" do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    visit root_path 
  end
  describe 'I click on login and am taken to login page' do 
    it 'i input my correct unique email and password and am taken to dashboard' do 
      click_on "Log In" 
      expect(current_path).to eq('/login')
      fill_in("Name",         with: "Mary")
      fill_in("Email",         with: "mary.smith@gmail.com")
      fill_in :password, with: "test432"
      fill_in :password_confirmation, with: "test432"

      click_on "Submit" 
      expect(current_path).to eq(user_path(@mary))
    end

    it 'cannot login with bad credentials' do 
      visit login_path 
      fill_in("Name",         with: "Mary")
      fill_in("Email",         with: "mary.smith@gmail.com")
      fill_in :password, with: "bad_password"
      fill_in :password_confirmation, with: "test123"

      click_on "Submit"
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sorry, your credentials are bad.")
    end
  end

end