class QuizResultsController < ApplicationController
  def create
    @quiz_result = QuizResult.new(quiz_result_params)
    @quiz_result.user = current_user
    # authorize @user_skill, policy_class: QuizResultPolicy
    @quiz_result.save
  end

  private

  def quiz_result_params
    params.require(:quiz_result).permit(:quiz_question_option_id, :quiz_question_id)
  end
end
