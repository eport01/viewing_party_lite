require "rails_helper"


RSpec.describe("discover index page ") do
  describe("discover page") do
    before(:each) do
      @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
      @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    end

    it 'has a button to find top rated movies', :vcr do
      visit(user_discover_path(@steve))
      click_button("Find Top Rated Movies")
      expect(current_path).to(eq("/users/#{@steve.id}/movies"))
      expect(page.status_code).to(eq(200))
      expect(page).to(have_content("The Godfather Vote Average: 8.7"))
      expect(page).to(have_content("The Shawshank Redemption Vote Average: 8.7"))
      expect(page).to(have_content("The Godfather Part II Vote Average: 8.6"))
    end
  end
end
