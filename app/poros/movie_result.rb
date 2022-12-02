class MovieResult
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview, 
              :id 
              
  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
    @id = attributes[:id]
  end
end