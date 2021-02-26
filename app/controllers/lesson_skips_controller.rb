class LessonSkipsController < ApplicationController
  def create
    find_lesson
    @lesson_skip = LessonSkip.new(lesson_skip_params)
    set_user(@lesson_skip, @lesson_skipped, current_user) if check_cuukies(current_user)

    authorize @lesson_skip, policy_class: LessonSkipPolicy

    if @lesson_skip.save
      redirect_to lesson_path(@lesson), notice: "Lesson skipped"
      LessonValidation.create(lesson: @lesson_skipped, user: current_user, validated: false)
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't skip"
    end
  end

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
    current_lesson_id = params[:lesson_id].to_i
    @lesson_skipped = Lesson.find(current_lesson_id - 1)
  end

  def set_user(lesson_skip, lesson, user)
    lesson_skip.lesson = lesson
    lesson_skip.user = user
  end

  def check_cuukies(user)
    user.cuukies >= 5
  end

  def lesson_skip_params
    params.require(:lesson_skip).permit(:reason)
  end
end
