class FeelsController < ApplicationController
  def index
    @user = current_user
    flash[:notice] = "Im a flash message"
    @feel = Feel.new
    @feels = current_user.feels.all
  end

  def create
    @feel = current_user.feels.new(feel_params)
    if @feel.save
      flash[:success] = "Your retro has been saved."
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
end
