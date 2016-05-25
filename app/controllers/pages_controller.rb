class PagesController < ApplicationController
  before_action :find_user, only: [:dashboard]
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, only: :home
  skip_after_action :verify_authorized, only: :dashboard


  def home
  end

  def dashboard
    find_user
    @expeditions = current_user.expeditions.all
  end


  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache)
  end
end
