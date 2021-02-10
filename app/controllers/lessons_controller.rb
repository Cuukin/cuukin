class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @lesson_validation = LessonValidation.new
    # authorize @lesson_validation, policy_class: LessonValidationPolicy
    authorize @lesson, policy_class: LessonPolicy
  end
end
