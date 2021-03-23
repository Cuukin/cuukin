class LessonUnblocksController < ApplicationController
  def create
    find_lessons
    @lesson_unblock = LessonUnblock.new(lesson_skip_params)
    set_user(@lesson_unblock, @lesson, current_user) if check_cuukies(current_user)

    authorize @lesson_unblock, policy_class: LessonUnblockPolicy

    if @lesson_unblock.save
      redirect_to lesson_path(@lesson)
      LessonValidation.create(lesson: @lesson_validated, user: current_user, validated: false)
    else
      render :new
    end

    transition_currency(current_user)
  end

  private

  def find_lessons
    @lesson = Lesson.find(params[:lesson_id])
    lesson_id = @lesson.id - 1
    @lesson_validated = Lesson.find(lesson_id)
  end

  def set_user(lesson_unblock, lesson, user)
    lesson_unblock.lesson = lesson
    lesson_unblock.user = user
  end

  def check_cuukies(user)
    user.cuukies >= 5
  end

  def transition_currency(user)
    user.cuukies -= 5
    user.save
  end

  def lesson_skip_params
    params.require(:lesson_unblock).permit(:reason, :other_reason)
  end
end
