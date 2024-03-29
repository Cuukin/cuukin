class LessonValidationsController < ApplicationController
  before_action :set_lesson, only: [ :create, :update ]
  before_action :set_lesson_validation, :set_user_validations, only: [ :show, :book_completed? ]

  def show
    book_completed?

    authorize @lesson_validation, policy_class: LessonValidationPolicy
  end

  def create
    @lesson_validation = LessonValidation.new(lesson_validation_params)
    @lesson_validation.validated = true
    set_user(@lesson_validation, @lesson, current_user)

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      TransitionLessonStarsJob.perform_later(current_user, @lesson_validation)
      UpdateBadgesJob.perform_later(current_user, @lesson_validation)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson_validation)
      TransitionAwardsJob.perform_later(current_user)
      redirect_to lesson_validation_path(@lesson_validation)
    else
      redirect_to lesson_path(@lesson)
    end
  end

  def update
    @lesson_validation = LessonValidation.find_by(lesson_id: @lesson.id, user: current_user)
    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.update(lesson_validation_params)
      @lesson_validation.validated = true
      @lesson_validation.save
      TransitionLessonStarsJob.perform_now(current_user, @lesson_validation)
      UpdateBadgesJob.perform_later(current_user, @lesson_validation)
      TransitionExtraRecipesJob.perform_later(current_user, @lesson_validation)
      TransitionAwardsJob.perform_later(current_user)
      redirect_to lesson_validation_path(@lesson_validation)
    else
      redirect_to lesson_path(@lesson)
    end
  end

  private

  def book_completed?
    @book_completed = @validated_lessons.count == @book.lessons.count
  end

  def set_user_validations
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
  end

  def set_lesson_validation
    @lesson_validation = LessonValidation.find(params[:id])
    @book = @lesson_validation.lesson.book
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_user(lesson_validation, lesson, user)
    lesson_validation.lesson = lesson
    lesson_validation.user = user
  end

  def lesson_validation_params
    params.require(:lesson_validation).permit(:difficulcy, :notes, :liked, :photo, :recipe_id, :public)
  end
end
