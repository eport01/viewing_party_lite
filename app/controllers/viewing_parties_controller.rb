class ViewingPartiesController < ApplicationController
  def new 
    @user = User.find(params[:user_id])

    @result = MovieFacade.results(params[:movie_id]) 
    # require 'pry'; binding.pry
  end

  def create 
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
    @viewing_party = ViewingParty.create!(parties_params)
    redirect_to user_path(@user)
  end

  private 
  def parties_params 
    params.permit(:duration, :date, :time, :movie_id, :movie_title)
  end

  def index 
    @viewing_parties = ViewingParties.all 
  end
end