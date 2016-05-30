class ActivitiesController < ApplicationController

  def create
    @activity = Activity.create(activity_params)
    authorize @activity
    @expedition = Expedition.find(params[:expedition_id])
    redirect_to expedition_path(@expedition)
  end

  def update
    @expedition = Expedition.find(params[:expedition_id])
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.update(activity_params)
    redirect_to expedition_path(@expedition)
  end


  def destroy
    @expedition = Expedition.find(params[:expedition_id])
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.destroy
    redirect_to expedition_path(@expedition)
  end

  private

  def find_activity
    @activity = Activity.find(params[:activity_id])
  end

  def activity_params
    params.require(:activity).permit(:title, :day_id, :description, :category, :address, :starts_on, :ends_on, :photo, :photo_cache)
  end

end
