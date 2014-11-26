class UsersController < ApplicationController
  def new
    @user = User.new
  end
      
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You're all signed up"
      flash[:color] = "valid"
      redirect_to feels_path
    else
      #flash.keep(:notice)
      redirect_to feels_path, notice: "Must include email and phone"
    end
  end

  def user_params
    params.require(:user).permit(:email, :phone)
  end
end
