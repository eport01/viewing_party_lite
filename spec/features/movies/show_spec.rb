require "rails_helper"


RSpec.describe("movies show page") do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    @movie = MovieResult.new(    title: "The Godfather",     vote_average: "8.715",     runtime: "175",     genres: "Drama Crime",     overview: "Spanning the years",     id: 238)
  end

  it("displays a movies information from multiple API calls on a movie show page", :vcr) do
    visit(user_movie_path(@mary, @movie.id))
    expect(page.status_code).to(eq(200))
    expect(page).to(have_content("Genre: Drama Crime"))
    expect(page).to(have_content("Vote: 8.715"))
    expect(page).to(have_content("Actor Name: Marlon Brando Character Name: Don Vito Corleone"))
    expect(page).to(have_content("The best movie ever..."))
    expect(page).to(have_button("Discover Movies"))
  end

  it 'when a visitor clicks on create viewing party, they are redirected back to movie show page with error message', :vcr do 
    visit(user_movie_path(@mary, @movie.id))
    click_button "Create Viewing Party for #{@movie.title}"
    expect(current_path).to eq(user_movie_path(@mary, @movie.id))
    expect(page).to have_content("You must be logged in or registered to create a movie party")
    
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@mary)
    # click_button "Create Viewing Party for #{@movie.title}"
    # expect(current_path).to eq(new_user_movie_viewing_party_path(@steve, "238"))

  end
end
