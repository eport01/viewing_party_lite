require "rails_helper"

RSpec.describe MovieReview do
  it "exists" do
    attrs = {
      author: "Steve",
      content: "The Godfather is a film considered by most"
    }

    movie_review = MovieReview.new(attrs)

    expect(movie_review).to be_a MovieReview
    expect(movie_review.author).to eq("Steve")
    expect(movie_review.content).to eq("The Godfather is a film considered by most")
  end
end