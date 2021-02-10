class LessonValidationsController < ApplicationController

  def create
    find_lesson
    @lesson_validation = LessonValidation.new(lesson_validation_params)
    @lesson_validation.lesson = @lesson
    @lesson_validation.user = current_user

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      redirect_to lesson_path(@lesson), notice: "Lesson validated"
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def lesson_validation_params
    params.require(:lesson_validation).permit(:difficulcy, :notes, :photo)
  end
end
