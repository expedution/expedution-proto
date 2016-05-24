class ExpeditionsController < ApplicationController

  before_action :find_expedition, only: [:show]#, :edit, :update, :destroy]


  def index
    @expeditions = Expedition.all
  end

  def new
    @expedition = Expedition.new
    authorize @expedition
  end

  def create
    @expedition = Expedition.new(expedition_params)
    authorize @expedition
    if @expedition.save
      redirect_to expedition_path(@expedition)
      # Créer un message d'alerte: Félicitations, votre LEX est crée #
    else
      render "expeditions/new"
    end
  end


  def show
    find_expedition
    authorize @expedition
  end

  def edit
  end

  # def destroy
  #   find_expedition
  #   @expedition.destroy
  #   redirect_to home_path
  # end

  private

  def expedition_params
    params.require(:expedition).permit(:title, :description, :theme, :capacity, :starts_on, :ends_on, :photo, :photo_cache, :user_id)
  end

  def find_expedition
    @expedition = Expedition.find(params[:id])
  end

end