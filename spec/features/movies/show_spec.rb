require "rails_helper"


RSpec.describe("movies show page") do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    @movie = MovieResult.new(    title: "The Godfather",     vote_average: "8.715",     runtime: "175",     genres: "Drama Crime",     overview: "Spanning the years",     id: 238)
  end

    # VCR.insert_cassette "multiple API calls on a movie show"
    # visit(user_discover_path(@steve))
    # click_button("Find Top Rated Movies")
    # expect(page).to have_link("The Godfather")
    # click_link "The Godfather"
  it("displays a movies information from multiple API calls on a movie show page", :vcr) do
    visit(user_movie_path(@mary, @movie.id))
    expect(page.status_code).to(eq(200))
    expect(page).to(have_content("Genre: Drama Crime"))
    expect(page).to(have_content("Vote: 8.715"))
    expect(page).to(have_content("Actor Name: Marlon Brando Character Name: Don Vito Corleone"))
    expect(page).to(have_content("The best movie ever..."))
    expect(page).to(have_button("Discover Movies"))
  end
end
