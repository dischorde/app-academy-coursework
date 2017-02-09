class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = ["Invalid sign up :("]
      redirect_to new_user_url
    end
  end


  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
