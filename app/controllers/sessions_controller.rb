class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = @user.id
    if @user.email != nil
      redirect_to complaints_path
    else
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end
