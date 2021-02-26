class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @lesson_validation = LessonValidation.new
    @lesson_unblock = LessonUnblock.new

    @user_validations = LessonValidation.joins(:lesson).where(user: current_user)
    @user_validations = @user_validations.map {|validation| validation.lesson}

    unless @user_validations.empty?
      last_validated_lesson_id = @user_validations.last.id
      unless @lesson.id >= Lesson.all.count
        @current_lesson = [Lesson.find(last_validated_lesson_id + 1)]
      end
    end

    book = Lesson.find(params[:id]).book
    @first_lesson = book.lessons[0] == @lesson ? [@lesson] : []

    authorize @lesson, policy_class: LessonPolicy
  end

  # Check if there is a LessonValidation.validated for that Lesson
    # if yes - lesson is completed
  # If not, check if its first Lesson of the book
    # if yes - lesson is open
  # If not, check if there is NOT a LessonValidation for the direct previous lesson
    # if yes - lesson is blocked
  # If not (meaning: direct previous lesson was validated), check if
  # If not (meaning: direct previous lesson was validated)
    # lesson is open

  # Allow user to validate a skipped lesson:
    # have a edit/update path for lessons
    # if lesson.validation.validated = false for that lesson
      # allow user to click on edit path to patch the lesson validation
      # changes validated from false to true
    # elsif lesson.validation.valited = true then show 'lesson validated'
    # elsif theres no lesson validation then show 'validate lesson' with create path

  # current_user.user_recipes.count -> use this on navbar to get dishes count
end
