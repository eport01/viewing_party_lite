class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @parties = @user.view_party_status
  end

  def new
  end

  def create
    require "pry"

    binding.pry
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to(user_path(@user.id))
    else
      flash[:alert] = @user.errors.full_messages.to_s
      redirect_to(register_path)
    end
  end

  def login_form
  end

  def login_user
    @user = User.find_by(    email: params[:email])

    if @user.authenticate(params[:password])
      flash[:success] = "Welcome back, #{@user.name}!"
      session[:user_id] = @user.id
      redirect_to(user_path(@user))
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to(login_path)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
