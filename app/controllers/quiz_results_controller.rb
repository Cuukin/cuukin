class QuizResultsController < ApplicationController
  def create
    @quiz_result = QuizResult.new(quiz_result_params)
    @quiz_result.user = current_user
    authorize @quiz_result, policy_class: QuizResultPolicy
    @quiz_result.save
  end

  def skip
    @quiz_result = QuizResult.new(quiz_result_params)
    @quiz_result.user = current_user
    correct_answer = @quiz_result.quiz_question.quiz_question_options.select {|option| option.is_correct}
    @quiz_question_option = correct_answer
    authorize @quiz_result, policy_class: QuizResultPolicy
    @quiz_result.save if transition_currency
  end

  private

  def transition_currency
    if current_user.cuukies >= 5
      user.cuukies -= 5
      user.save
    else
      false
    end
  end

  def quiz_result_params
    params.require(:quiz_result).permit(:quiz_question_option_id, :quiz_question_id)
  end
end
