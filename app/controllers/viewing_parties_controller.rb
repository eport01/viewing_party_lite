class ViewingPartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    # require 'pry'; binding.pry
    if @user == current_user

      @users = User.all
      @user = User.find(params[:user_id])
      @result = MovieFacade.results(params[:movie_id])
    else
      @user = User.find(params[:user_id])
      @result = MovieFacade.results(params[:movie_id])
      redirect_to user_movie_path(@user, @result.id)
      flash[:party] = "You must be logged in or registered to create a movie party"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @result = MovieFacade.results(params[:movie_id])
    @viewing_party = ViewingParty.new(parties_params)

    if @viewing_party.save 
      @user_party = UserViewingParty.create!(status: "Host", viewing_party: @viewing_party, user: @user)
      if params[:attendees]
        attendees = User.find(params[:attendees])
        # require 'pry'; binding.pry
        attendees.each do |attendee|
          UserViewingParty.create!(user: attendee , viewing_party: @viewing_party, status: "Attending")

        end
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
