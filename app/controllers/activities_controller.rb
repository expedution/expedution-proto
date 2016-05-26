class ActivitiesController < ApplicationController

  def index
    @activity = Activities.all
  end

  def show
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new
    @activity.day =
    authorize @activity
  end

  def edit
  end

  def destroy
  end

end
