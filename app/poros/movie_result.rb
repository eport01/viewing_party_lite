class MovieResult
  attr_reader :title, :vote_average, :runtime, :genres, :overview, :id, :pic

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @id = attributes[:id]
    @pic = ("https://image.tmdb.org/t/p/w500") << (attributes[:poster_path]).to_s
  end
end
