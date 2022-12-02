class ViewingPartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
  end

  def create
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
    @viewing_party = ViewingParty.new(parties_params)

    if @viewing_party.save 
      @user_party = UserViewingParty.create!(status: "Host", viewing_party: @viewing_party, user: @user)
      @attendees = User.find(params[:attendees])
      @attendees.each do |attendee|
        UserViewingParty.create!(user: attendee, viewing_party: @viewing_party, status: "Attending")
      end
    end

    # require 'pry'; binding.pry
    redirect_to(user_path(@user))
  end

  private

  def parties_params
    params.permit(:duration, :date, :time, :movie_id, :movie_title)
  end
end
