class Movie
  attr_reader :title

  def initialize(movie_attributes)
    @title = movie_attributes[:title]
  end
end
