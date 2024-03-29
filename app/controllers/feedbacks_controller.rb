class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.page_params = request.referrer

    authorize @feedback, policy_class: FeedbackPolicy

    if @feedback.save
      @feedback = Feedback.new
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :feedback }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :description)
  end
end
