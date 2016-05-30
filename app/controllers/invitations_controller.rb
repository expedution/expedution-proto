class InvitationsController < ApplicationController
  #before_action :invitation_params

  def new
    @invitation = Invitation.new
    authorize @invitation
  end

  def create
    @expedition = Expedition.find(params[:expedition_id])
    # Create an invitation
    @invitation = Invitation.new(invitation_params)
    @invitation.expedition = @expedition
    authorize @invitation
      # Add the participation to the user
    if @invitation.save
      redirect_to expedition_path(@expedition)
    else
      render :new
    end

  end

  def invite
    @expedition = Expedition.find(params[:expedition_id])
    @invitation = Invitation.find(params[:id])
    authorize @invitation
      # If email already exist in the database, send a new email to tell the user she/he added to a new lex
      if !User.where(email: @invitation.email).blank? && !Invitation.where(email: @invitation.email).blank?
        # Send an email to share about a new LEX
        #Particaion of the user
        UserMailer.newexpedition(@invitation).deliver_now
        #@invitation.update(state: "pending")

        redirect_to expedition_path(@expedition)
      else
        User.invite!(:email => @invitation.email, :first_name => @invitation.first_name)
        redirect_to expedition_path(@expedition)
         # Send a token via invitable
      end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:first_name, :last_name, :email)
  end
end
