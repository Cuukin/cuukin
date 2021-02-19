class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @lesson_validation = LessonValidation.new
    authorize @lesson, policy_class: LessonPolicy
  end
end
