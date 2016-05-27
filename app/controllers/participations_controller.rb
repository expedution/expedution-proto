class ParticipationsController < ApplicationController
  before_action :find_participation, only: [:update, :destroy]
  before_action :find_expedition

  def create
    @participation = @expedition.participations.new
    # Check if user exist if not create it
    @user = User.where(email: params[:participation][:email]).first_or_initialize do |user|
      user.first_name = params[:participation][:first_name]
      user.last_name = params[:participation][:last_name]
      # Fake password for validation
      user.password = Devise.friendly_token[0,20]
    end

    @user.save
    # Set participation user_id
    @participation.user = @user
    if @participation.save
      redirect_to expedition_path(@expedition)
    else
      render "expeditions/show"
    end
    authorize @participation
  end

  private

  def find_participation
    @participation = Participation.find(params[:id])
  end

  def find_expedition
    @expedition = Expedition.find(params[:expedition_id])
  end

end
