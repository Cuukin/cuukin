class LessonValidationsController < ApplicationController
  before_action :set_lesson, only: [ :create, :update ]

  def create
    @lesson_validation = LessonValidation.new(lesson_validation_params)
    @lesson_validation.validated = true
    set_user(@lesson_validation, @lesson, current_user)

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      ValidateBookCompletionJob.perform_now(current_user, @lesson_validation)
      UpdateBadgesJob.perform_later(current_user, @lesson)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson.recipe)
      TransitionAwardsJob.perform_later(current_user)
      redirect_to book_path(@lesson.book), notice: "Lesson validated"
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end
  end

  def update
    @lesson_validation = LessonValidation.find_by(lesson_id: @lesson.id, user: current_user)
    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.update(lesson_validation_params)
      @lesson_validation.validated = true
      @lesson_validation.save
      ValidateBookCompletionJob.perform_now(current_user, @lesson_validation)
      UpdateBadgesJob.perform_later(current_user, @lesson)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson.recipe)
      TransitionAwardsJob.perform_later(current_user)
      redirect_to book_path(@lesson.book)
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end
  end

  private

  def set_lesson
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
