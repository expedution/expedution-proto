class FeedbacksController < ApplicationController
  before_action :set_feedbacks, only: [:create]

  def create
    @expedition = find_activity.day.expedition
    @feedback = Feedback.new(set_feedbacks)
    @feedback.activity = @activity
    @feedback.user = current_user

    authorize @feedback
    if @feedback.save
      respond_to do |format|
        format.html { redirect_to expedition_path(@expedition) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'expedition/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def find_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_feedbacks
    params.require(:feedback).permit(:content, :rating)
  end
end
