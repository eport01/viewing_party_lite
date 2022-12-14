class Default::DashboardController < ApplicationController
  before_action :require_default 
  def index 
    redirect_to user_path(current_user)


  end

  private 
  def require_default
    # render file: "/public/404" unless current_default?
    if !current_default?
      flash[:message] = "You must be logged in or registered to access your dashboard"
      redirect_to root_path 
    end

  end
end