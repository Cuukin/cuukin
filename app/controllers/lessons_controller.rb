class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @lesson_validation = LessonValidation.new

    @user_validations = LessonValidation.joins(:lesson).where(user: current_user)
    @user_validations = @user_validations.map {|validation| validation.lesson}

    unless @user_validations.empty?
      last_validated_lesson_id = @user_validations.last.id
      @current_lesson = [Lesson.find(last_validated_lesson_id + 1)]
    end

    book = Lesson.find(params[:id]).book
    @first_lesson = book.lessons[0] == @lesson ? [@lesson] : []

    authorize @lesson, policy_class: LessonPolicy
  end
end
