class FeedbacksController < ApplicationController

  def create
    @expedition = find_activity.day.expedition
    @feedback = Feedback.new(feedbacks_params)
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

  def destroy
    find_activity
    @feedback = Feedback.find(params[:id])
    # methode authorize avant le destroy pour empecher la destruction si user not authorized
    authorize @feedback
    @feedback.destroy
    redirect_to expedition_path(@activity.day.expedition)
  end

  private

  def find_activity
    @activity = Activity.find(params[:activity_id])
  end

  def feedbacks_params
    params.require(:feedback).permit(:content, :rating)
  end
end
