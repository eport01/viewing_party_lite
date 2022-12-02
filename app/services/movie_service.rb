class MovieService 

  def self.connection
    Faraday.new(    url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["movies_api_key"]
    end
  end

  def self.get_url(url)
    JSON.parse(connection.get(url).body, symbolize_names: true)
  end

  def self.movie_results(movie_id)
    get_url("/3/movie/#{movie_id}")

  end


  def self.top_movies
    get_url("/3/movie/top_rated")

  end

  def self.search(keyword)
    get_url("/3/search/movie?query=#{keyword}")

  end

  def self.movie_reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  def self.movie_cast(movie_id) 
    get_url("/3/movie/#{movie_id}/credits")
  end
end