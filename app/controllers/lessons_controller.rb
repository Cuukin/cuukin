class LessonsController < ApplicationController
  before_action :set_lesson, :set_validations

  def show
    validated?
    available?
    locked?

    @lesson_validation = LessonValidation.new
    @user_skill = UserSkill.new
    @feedback = Feedback.new
    @quiz_result = QuizResult.new

    authorize @lesson, policy_class: LessonPolicy
  end

  private

  def locked?
    first?
    @locked = !(@available || @first)
  end

  def validated?
    @validated = @validated_lessons.include?(@lesson)
  end

  def first?
    @first = @lesson.order_in_book == 1
  end

  def available?
    prev_lesson = @lesson.order_in_book - 1
    unless prev_lesson == 0
      @available = @validated_lessons.include?(Lesson.find_by(order_in_book: prev_lesson))
    end
  end

  def set_validations
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
    @book = @lesson.book
  end
end
