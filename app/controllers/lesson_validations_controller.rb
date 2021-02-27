class LessonValidationsController < ApplicationController

  def create
    find_lesson

    @lesson_validation = LessonValidation.new(lesson_validation_params)
    set_user(@lesson_validation, @lesson, current_user)

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      redirect_to book_path(@lesson.book), notice: "Lesson validated"
      transition_currencies(@lesson_validation, current_user)
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end
  end

  private

  def transition_currencies(lesson_validation, user)
    if lesson_validation.validated
      user.xp += lesson_validation.lesson.xp
      user.save
    else
      user.cuukies -= 5
      user.save
    end
  end

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_user(lesson_validation, lesson, user)
    lesson_validation.lesson = lesson
    lesson_validation.user = user
  end

  def lesson_validation_params
    params.require(:lesson_validation).permit(:difficulcy, :notes, :photo)
  end
end
