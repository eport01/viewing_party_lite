class ApplicationController < ActionController::Base
  
  def current_user
    #check if user is stored in cookie, we find user and set equal to current user
    #if we've done it already we don't need to do code after || 
    #memoizing we need instance variable, prevent hitting the db every single page
    # @current_user ||= User.find(cookie.encrypted[:user_id]) if cookie.encrypted[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end
  def current_admin?
    current_user && current_user.admin? 
  end


end
