class Admin::DashboardController < ApplicationController
  before_action :require_admin 


  def index 
    # user_id = cookies.encrypted[:user_id]
    # user = User.find(user_id)

    # if !user.admin?
    #   render file: "/public 404"

    # end

    # @user = user 
  end



  private 
  def require_admin
    render file: "/public/404" unless current_admin? 
  end
end