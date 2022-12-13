class WelcomeController < ApplicationController
  def index
    # unless cookies.encrypted[:greeting]
    #   cookies.encrypted[:greeting] = "Hello"
    # end
    if current_user 
      User.find_by(id: session[:user_id])
      # require 'pry'; binding.pry
    end
    @users = User.all 

    # @users = User.all 
  end
end
