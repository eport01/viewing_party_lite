class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parties = @user.view_party_status 
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation && @user.valid?
      @user.save
      flash[:success] = "welcome #{@user.name}"
      redirect_to(user_path(@user.id))
    elsif
      flash[:failure] = "Passwords need to match"
      redirect_to(register_path)
    end
  end

  def login 
    @user = User.find_by(email: params[:email])

      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to(user_path(@user.id))

      # redirect_to login_path

  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
