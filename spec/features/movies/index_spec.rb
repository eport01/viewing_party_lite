require "rails_helper"


RSpec.describe("discover movies page or movies index page ") do
  describe("discover page") do
    before(:each) do
      @steve = User.create!(      name: "Steve",       email: "steve.smith@gmail.com",       password: "123test",       password_confirmation: "123test")
      @mary = User.create!(      name: "Mary",       email: "mary.smith@gmail.com",       password: "test123",       password_confirmation: "test123")
      visit("/register")
    end

    it("shows a list of top rated movies from the api", :vcr) do
      visit(user_discover_path(@steve))
      click_button("Find Top Rated Movies")
      expect(current_path).to(eq("/users/#{@steve.id}/movies"))
      expect(page.status_code).to(eq(200))
      expect(page).to(have_content("The Godfather Vote Average: 8.7"))
      expect(page).to(have_content("20th Century Girl Vote Average: 8.7"))
      expect(page).to(have_content("Dilwale Dulhania Le Jayenge Vote Average: 8.6"))
    end

    it("enter keyword into search and it returns movies with that word", :vcr) do
      visit(user_discover_path(@steve))
      fill_in("keyword",       with: "godfather")
      click_button("Submit")
      expect(current_path).to(eq("/users/#{@steve.id}/movies"))
      expect(page.status_code).to(eq(200))
      expect(page).to(have_content("The Godfather Vote Average: 8.7"))
      expect(page).to(have_content("The Godfather Part III Vote Average: 7.4"))
      expect(page).to_not(have_content("Dilwale Dulhania Le Jayenge Vote Average: 8.6"))
    end

    it("sad path testing for blank search entry") do
      visit(user_discover_path(@steve))
      click_button("Submit")
      expect(page).to(have_content("Search can't be blank!"))
      expect(current_path).to(eq(user_discover_path(@steve)))
    end
  end
end
