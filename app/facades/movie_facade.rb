class MovieFacade

  def self.results(movie_id)
    result = MovieService.movie_results(movie_id)
    MovieResult.new(result)
  end

  def self.reviews(movie_id)
    MovieService.movie_reviews(movie_id)[:results].map do |review|
      MovieReview.new(review)
    end
  end

  def self.cast(movie_id)
    MovieService.movie_cast(movie_id)[:cast].map do |cast|
      MovieCast.new(cast)
    end
  end

  def self.top_rated
    MovieService.top_movies[:results].map do |result|
      MovieResult.new(result)
    end
  end

  def self.keyword(keyword)
    MovieService.search(keyword)[:results].map do |result|
      MovieResult.new(result)
    end
  end
end
