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
    @user = current_user

    authorize @lesson, policy_class: LessonPolicy
  end

  private

  def locked?
    first?
    @locked = !(@validated || @available || @first)
  end

  def validated?
    @validated = @validated_lessons.include?(@lesson)
  end

  def first?
    @first = @lesson.order_in_book == 1
  end

  def available?
    prev_lesson_id = @lesson.order_in_book - 1
    unless prev_lesson_id == 0
      prev_lesson = @book.lessons.detect {|lesson| lesson.order_in_book == prev_lesson_id}
      @available = @validated_lessons.include?(prev_lesson)
    end
  end

  def set_validations
    validated_lessons = LessonValidation.includes(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
    @validated_lessons = validated_lessons.select {|lesson| lesson.book == @book}
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
    @book = @lesson.book
  end
end
