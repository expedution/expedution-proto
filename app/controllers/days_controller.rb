class DaysController < ApplicationController


  def create
    @day = Day.new(day_params)
    @expedition = Expedition.find(params[:expedition_id])
    @day.expedition = @expedition
    @day.save
    authorize @day
    redirect_to expedition_path(@expedition)
  end

  def update
  end

  def destroy
  end

  private

  def day_params
    params.require(:day).permit(:title, :position, :date)
  end

  def find_day
    @day = Day.find(params[:day_id])
  end

end
