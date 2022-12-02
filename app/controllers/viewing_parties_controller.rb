class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:id])
    @users = User.all
  end

  def create
    @viewingparties = ViewingParties.new(vp_params)
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:id])
  end

  private

  def vp_params
    params.permit(:movie_id, :duration, :date, :time, :movie_title)
  end
end
