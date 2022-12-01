require "rails_helper"


RSpec.describe("New Viewing Party Page") do
  before(:each) do
    @steve = User.create!(    name: "Steve",     email: "steve.smith@gmail.com")
    @mary = User.create!(    name: "Mary",     email: "mary.smith@gmail.com")
    visit(new_user_movie_viewing_party_path(@steve, "238"))
  end

  it("has ", :vcr) do
    expect(page).to(have_content("viewing party"))
    expect(page).to(have_content("The Godfather"))
    expect(page).to(have_button("Discover Page"))
    fill_in(:duration_of_Party,     with: "120")
    fill_in(:day,     with: "1/1/11")
    fill_in(:start_time,     with: "7:00")
  end
end
