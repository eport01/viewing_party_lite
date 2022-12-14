class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parties = @user.view_party_status 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      @user = User.find(params[:id])
      @parties = @user.view_party_status 
      # flash[:message] = "You must be logged in or registered to access your dashboard"
      # redirect_to root_path 

    end
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation && @user.valid?
      @user.save
      session[:user_id] = @user.id 
      flash[:success] = "welcome #{@user.name}"
      # flash[:error] = user.errors.full_messages.to_sentance
      redirect_to(user_path(@user.id))
    elsif
      flash[:failure] = "Passwords need to match"
      redirect_to(register_path)
    end
  end

  def login 
    @user = User.find_by(email: params[:email])
    # require 'pry'; binding.pry
    if @user && @user.authenticate(params[:password])
      # cookies.encrypted[:user_id] = @user.id
      # if @user.admin?
      #   redirect_to admin_dashboard_path
      # elsif @user.manager?
      #   redirect_to manage_dashboard_path 
      # elsif @user.default?
      #   redirect_to user_dashboard_path
      # end
      session[:user_id] = @user.id 
      # flash[:success] = "Welcome, #{@user.name}!"
      redirect_to(user_path(@user.id))
    else
      flash[:bad_credentials] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
  end

  def destroy 
    # if @current_user != nil 
      session.delete(:user_id)
      @current_user = nil 
      redirect_to root_path 

    # end

  end

  # def destroy 
  #   logout 
  #   redirect_to root_path 
  # end


  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
