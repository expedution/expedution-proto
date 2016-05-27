class ActivitiesController < ApplicationController

  def create
    @activity = Activity.create(activity_params)
    authorize @activity
    @expedition = Expedition.find(params[:expedition_id])
    redirect_to expedition_path(@expedition)
  end

  def destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :day_id, :description, :category, :address, :starts_on, :ends_on, :photo, :photo_cache)
  end

end
