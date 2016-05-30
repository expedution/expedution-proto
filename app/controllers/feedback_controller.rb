class FeedbackController < ApplicationController
  before_action :set_feedbacks, only: [:create]

  def create
    @feedback = feedback.new(set_feedbacks)
    @feedback.activity = @activity
    redirect_to expedition_path(@expedition)
  end

  private

  def find_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_feedbacks
    params.require(:feedbacks).permit(:content, :rating)
  end
end
