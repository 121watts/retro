class FeelsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @feel = Feel.new
    @feel_for_today = current_user.feel_for_today
    @feels = current_user.feels.all.order("created_at DESC").paginate(:page => params[:page], per_page: 5)
  end

  def create
    @feel = current_user.feels.new(feel_params)
    if @feel.save
      flash[:notice] = "Your feel has been saved."
      redirect_to feels_path
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to feels_path
    end
  end

  private

  def feel_params
    params.require(:feel).permit(:body, :emoji, :user_id)
  end

  def require_login
    unless current_user
      flash[:error] = "You must log in first."
      redirect_to root_path
    end
  end
end
