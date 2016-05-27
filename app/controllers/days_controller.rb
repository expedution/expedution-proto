class DaysController < ApplicationController


  def create
    @day = Day.new(day_params)
    @day.expedition = @expedition.id
    @day.save
    authorize @day
  end

  def update
  end

  def destroy
  end

  private

  def day_params
    params.require(:day).permit(:title, :position, :date)
  end

end
