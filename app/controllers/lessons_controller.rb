class LessonsController < ApplicationController
  before_action :set_lesson
  before_action :set_validations

  def show
    validated?
    skipped?
    first?
    open?
    open_to_unblock?

    unless @validated || @skipped
      @lesson_validation = LessonValidation.new
    end

    if @open_to_unblock
      @lesson_unblock = LessonUnblock.new
    end

    authorize @lesson, policy_class: LessonPolicy
  end

  private

  def validated?
    validated_lessons = @validated_lessons.select {|val| val.validated}
    validated_lessons = validated_lessons.map {|val| val.lesson}
    @validated = validated_lessons.include?(@lesson)
  end

  def skipped?
    validated_lessons = @validated_lessons.reject {|val| val.validated}
    validated_lessons = validated_lessons.map {|val| val.lesson}
    @skipped = validated_lessons.include?(@lesson)
  end

  def first?
    @first = (@book.lessons.first == @lesson)
  end

  def open?
    validated_lessons = @validated_lessons.map {|val| val.lesson}
    prev_lesson = @book.lessons.select {|l| l.id == (@lesson.id - 1)}
    @open = validated_lessons.include?(prev_lesson)
  end

  def open_to_unblock?
    validated_lessons = @validated_lessons.map {|val| val.lesson}
    prev_lesson = @book.lessons.select {|l| l.id == (@lesson.id - 2)}
    is_second = (@book.lessons.first.id + 1 == @lesson.id)
    @open_to_unblock = is_second || validated_lessons.include?(prev_lesson)
  end

  def set_validations
    @validated_lessons = LessonValidation.joins(:lesson).where(user: current_user)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
    @book = @lesson.book
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
