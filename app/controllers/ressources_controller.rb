class RessourcesController < ApplicationController

  def create
    @ressource = Ressource.create(ressource_params)
    authorize @ressource
    @expedition = Expedition.find(params[:expedition_id])
    redirect_to expedition_path(@expedition)
  end

  def update
    @expedition = Expedition.find(params[:expedition_id])
    @ressource = Ressource.find(params[:id])
    authorize @ressource
    @ressource.update(ressource_params)
    redirect_to expedition_path(@expedition)
  end

  def destroy
    @expedition = Expedition.find(params[:expedition_id])
    @ressource = Ressource.find(params[:id])
    authorize @ressource
    @ressource.update(ressource_params)
    redirect_to expedition_path(@expedition)
  end

  private

  def ressource_params
    params.require(:ressource).permit(:name, :activity_id, :category, :description, :url, :photo, :photo_cache)
  end

end
