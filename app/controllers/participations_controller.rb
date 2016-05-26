# class ExpeditionsController < ApplicationController

#   before_action :find_participation, only: [:show, :edit, :update, :destroy]

#   def index
#     @participations = Participation.all
#   end

#   def new
#     @participation = Participation.new
#     authorize @participation
#   end

#   def create
#     @participation = Participation.new(participation_params)
#     @participation.user = current_user
#     authorize @participation
#     if @participation.save
#       User.invite!(:email => participation.user, :first_name => user.first_name, :last_name.last_name)
#       redirect_to participation_path(@participation)
#       # Créer un message d'alerte: Félicitations, votre LEX est crée #
#     else
#       render "participations/new"
#     end
#   end


#   # def show
#   #   find_participation
#   #   authorize @participation
#   #   @days = Day.all
#   #   @participations = participation.all
#   #   @days_participation = Day.find_by(participation_id: @participation.id)
#   # end

#   # def edit
#   # end

#   # def update
#   #   if @participation.update(participation_params)
#   #     redirect_to dashboard_path
#   #   else
#   #     render :edit
#   #   end
#   #   authorize @expedition
#   # end


#   private

#   def expedition_params
#     params.require(:particitaton).permit(:title, :location, :description, :theme, :capacity, :starts_on, :ends_on, :photo, :photo_cache)
#   end

#   def find_expedition
#     @expedition = Expedition.find(params[:id])
#   end

# end
