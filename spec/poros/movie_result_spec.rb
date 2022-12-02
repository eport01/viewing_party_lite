require "rails_helper"

RSpec.describe MovieResult do
  it "exists" do
    attrs = {
      title: "The Godfather",
      vote_average: "8.715",
      runtime: "175",
      genres: "Drama Crime",
      overview: "Spanning the years",
      id: 20
    }

    movie_result = MovieResult.new(attrs)

    expect(movie_result).to be_a MovieResult
    expect(movie_result.title).to eq("The Godfather")
    expect(movie_result.vote_average).to eq("8.715")
    expect(movie_result.runtime).to eq("175")
    expect(movie_result.genres).to eq("Drama Crime")
    expect(movie_result.overview).to eq("Spanning the years")
    expect(movie_result.id).to eq(20)


  end
end