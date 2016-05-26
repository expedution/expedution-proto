class DaysController < ApplicationController


  def index
    @days = Day.all
  end

  def new
    @day = Day.new
    authorize @day
  end

  def create
    @day = Day.new(day_params)
    authorize @day
  end

  def show
    @days = Day.all
  end

  def edit
  end

  def destroy
  end

end
