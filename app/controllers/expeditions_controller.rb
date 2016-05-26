class ExpeditionsController < ApplicationController

  before_action :find_expedition, only: [:show, :edit, :update, :destroy]


  def index
    @expeditions = Expedition.all
  end

  def new
    @expedition = Expedition.new
    authorize @expedition
  end

  def create
    @expedition = Expedition.new(expedition_params)
    @expedition.user = current_user
    authorize @expedition
    if @expedition.save
      UserMailer.expeditioncreation(@expedition.user).deliver_now
      redirect_to expedition_path(@expedition)
      # Créer un message d'alerte: Félicitations, votre LEX est crée #
    else
      render "expeditions/new"
    end
  end


  def show
    find_expedition
    authorize @expedition
    @days = Day.all
    @expeditions = Expedition.all
    @days_expedition = Day.find_by(expedition_id: @expedition.id)
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
    params.require(:expedition).permit(:title, :location, :description, :theme, :capacity, :starts_on, :ends_on, :photo, :photo_cache)
  end

  def find_expedition
    @expedition = Expedition.find(params[:id])
  end

end
