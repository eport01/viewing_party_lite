class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    #if param q
    if params[:q]
      @results = MovieFacade.top_rated
    end
    if params[:keyword]
      @results = MovieFacade.keyword(params[:keyword]) 
    end
    #put conditional here 
    #if param keyword 
  end

  def show 
    # require 'pry'; binding.pry
    @results = MovieFacade.results(params[:id]) 
    @reviews = MovieFacade.reviews(params[:id]) 
    @cast = MovieFacade.cast(params[:id]) 
  end
end
