class FeelsController < ApplicationController
  def index
    @user = current_user
    flash[:notice] = "Im a flash message"
  end
end
