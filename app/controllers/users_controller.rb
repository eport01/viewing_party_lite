class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @parties = @user.view_party_status 
  end

  def new
  end

  def create
    @user = User.new(user_params)
    # require 'pry'; binding.pry
    if @user.password == @user.password_confirmation && @user.valid?
      @user.save
      flash[:success] = "welcome #{@user.name}"
      redirect_to(user_path(@user.id))
    else
      flash[:failure] = "Passwords need to match"
      redirect_to(register_path)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
