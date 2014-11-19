class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You're all signed up"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid" 
      flash[:color] = "invalid"
    end
    render "new"
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
