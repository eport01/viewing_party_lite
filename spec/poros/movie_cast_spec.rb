require "rails_helper"

RSpec.describe MovieCast do
  it "exists" do
    attrs = {
      name: "Marlon Brando",
      character: "Don Vito Corleone"
    }

    movie_cast = MovieCast.new(attrs)
    # require 'pry'; binding.pry
    expect(movie_cast).to be_a MovieCast
    expect(movie_cast.name).to eq("Marlon Brando")
    expect(movie_cast.character).to eq("Don Vito Corleone")
  end
end