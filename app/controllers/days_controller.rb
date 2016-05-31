class DaysController < ApplicationController
skip_after_action :verify_authorized, only: :home

  def create
    @day = Day.new(day_params)
    find_expedition
    @day.expedition = @expedition
    @day.save
    authorize @day
    redirect_to expedition_path(@expedition)
  end

  def update
    find_expedition
    find_day
    authorize @day
    @day.update(day_params)
    redirect_to expedition_path(@expedition)
  end

  def destroy
    find_expedition
    find_day
    authorize @day
    @day.destroy
    redirect_to expedition_path(@expedition)
  end

  private

  def day_params
    params.require(:day).permit(:title, :position, :date)
  end

  def find_day
    @day = Day.find(params[:id])
  end

  def find_expedition
    @expedition = Expedition.find(params[:expedition_id])
  end

end
