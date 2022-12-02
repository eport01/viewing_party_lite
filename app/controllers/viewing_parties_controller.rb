class ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
  end

    # require 'pry'; binding.pry
  def create
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
    @viewing_party = ViewingParty.create!(parties_params)
    UserViewingParty.create!(status: "Host", viewing_party_id: @viewing_party.id, user_id: @user.id)
    redirect_to(user_path(@user))
  end

  private

  def parties_params
    params.permit(:duration, :date, :time, :movie_id, :movie_title)
  end

  def index
    @viewing_parties = ViewingParties.all
  end
end
