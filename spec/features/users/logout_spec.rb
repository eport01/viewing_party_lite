require "rails_helper"


RSpec.describe "Logging out" do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
  end

  describe 'as a logged in user when i visit landing page i dont see link for log in or create account' do 
    it 'i click log out and am taken to landing page and link is now for log in' do 
      visit root_path 
      expect(page).to have_link "Log out"
      click_on "Log out" 
      expect(current_path).to eq(root_path)
    end
  end

end