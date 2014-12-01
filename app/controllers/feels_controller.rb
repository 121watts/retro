class FeelsController < ApplicationController
  def index
    @feel = Feel.new
  end

  def create
    @feel = current_user.feels.new(feel_params)
    if @feel.save
      flash[:notice] = "Your retro has been saved."
      render feels_path
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
