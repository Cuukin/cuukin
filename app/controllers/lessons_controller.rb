class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @lesson_validation = LessonValidation.new
    @user_validations = LessonValidation.joins(:lesson).where(user: current_user)
    @user_validations = @user_validations.map {|validation| validation.lesson}
    authorize @lesson, policy_class: LessonPolicy
  end
end
