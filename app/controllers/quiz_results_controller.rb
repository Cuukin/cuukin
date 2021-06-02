class QuizResultsController < ApplicationController
  def create
    @quiz_result = QuizResult.new(quiz_result_params)
    @quiz_result.user = current_user
    authorize @quiz_result, policy_class: QuizResultPolicy
    # transition_currencies(@quiz_result)
    @quiz_result.save
  end

  private

  # def transition_currencies(quiz_result)
  #   if quiz_result.quiz_question_option.is_correct
  #     current_user.xp += @quiz_result.quiz_question.xp
  #     current_user.save
  #   end
  # end

  def quiz_result_params
    params.require(:quiz_result).permit(:quiz_question_option_id, :quiz_question_id)
  end
end
