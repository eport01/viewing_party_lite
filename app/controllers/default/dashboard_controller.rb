class Default::DashboardController < ApplicationController
  before_action :require_default 
  def index 
    redirect_to user_path(@current_user)


  end

  private 
  def require_default
    render file: "/public/404" unless current_default?

  end
end