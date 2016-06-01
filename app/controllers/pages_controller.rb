class PagesController < ApplicationController
  before_action :find_user, only: [:home, :dashboard]
  skip_before_action :authenticate_user!, only: [:home, :about, :sourcing]
  skip_after_action :verify_authorized, only: :home
  skip_after_action :verify_authorized, only: :about
  skip_after_action :verify_authorized, only: :dashboard
  skip_after_action :verify_authorized, only: :sourcing
  skip_after_action :verify_authorized, only: :space_ideas

  def home
  end

  def about
  end

  def sourcing
  end

  def space_ideas
    @activity = Activity.find(params[:id])
  end

  def like
    @activity = Activity.find(params[:id])
    if current_user.liked? @activity
      @activity.unliked_by current_user
    else
      @activity.liked_by current_user
    end
  end

  def dashboard
    find_user
    if current_user.organiser
      @expeditions = current_user.expeditions
    else
      @expeditions = current_user.participant_expeditions
    end
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache)
  end

end


