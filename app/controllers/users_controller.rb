class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      flash[:notice] = "You're all signed up"
      flash[:color] = "valid"
      redirect_to feels_path
    else
      flash[:notice] = "Form is invalid" 
      flash[:color] = "invalid"
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
