class LessonValidationsController < ApplicationController

  def create
    find_lesson

    if params[:validation]
      @lesson_validation = LessonValidation.new(lesson_validation_params)
      set_user(@lesson_validation, @lesson, current_user)

      authorize @lesson_validation, policy_class: LessonValidationPolicy

      if @lesson_validation.save
        redirect_to lesson_path(@lesson), notice: "Lesson validated"
      else
        redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
      end
    elsif params[:skip]
      if cuukies_exchange(current_user)
        @lesson_validation = LessonValidation.new
        @lesson_validation.status = 'skipped'
        @lesson_validation.save
      else
        render :new, alert: 'Not enough Cuukies 🍪'
      end
    end
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_user(lesson_validation, lesson, user)
    lesson_validation.lesson = lesson
    lesson_validation.user = user
  end

  def cuukies_exchange(user)
    if user.cuukies >= 5
      user.cuukies -= 5
      user.save!
    else
      false
    end
  end

  def lesson_validation_params
    params.require(:lesson_validation).permit(:difficulcy, :notes, :photo)
  end
end
