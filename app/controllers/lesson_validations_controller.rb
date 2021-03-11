class LessonValidationsController < ApplicationController
  before_action :set_lesson, only: [ :create, :update ]

  def create
    @lesson_validation = LessonValidation.new(lesson_validation_params)
    @lesson_validation.validated = true
    set_user(@lesson_validation, @lesson, current_user)

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      UpdateBadgesJob.perform_later(current_user, @lesson)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson.recipe)
      ValidateBookCompletionJob.perform_later(current_user, @lesson_validation)
      redirect_to book_path(@lesson.book), notice: "Lesson validated"
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end

    transition_currency(@lesson, current_user)
  end

  def update
    @lesson_validation = LessonValidation.find_by(lesson_id: @lesson.id, user: current_user)
    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.update(lesson_validation_params)
      UpdateBadgesJob.perform_later(current_user, @lesson)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson.recipe)
      ValidateBookCompletionJob.perform_later(current_user, @lesson_validation)
      @lesson_validation.validated = true
      @lesson_validation.save
      redirect_to book_path(@lesson.book)
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end

    transition_currency(@lesson, current_user)
  end

  private

  def transition_currency(lesson, user)
    user.xp += lesson.xp
    user.save
  end

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
