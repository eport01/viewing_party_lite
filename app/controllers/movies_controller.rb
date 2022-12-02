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
  end

  def show
    @user = User.find(params[:user_id])

    # require 'pry'; binding.pry
    @result = MovieFacade.results(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
    @cast = MovieFacade.cast(params[:id])
  end
end
