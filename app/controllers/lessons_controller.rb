class LessonsController < ApplicationController
  before_action :set_lesson, :set_validations

  def show
    validated?
    skipped?
    first?
    open?
    open_to_unblock?

    @grocery_list = GroceryList.new
    @lesson_validation = LessonValidation.new
    @lesson_unblock = LessonUnblock.new

    authorize @lesson, policy_class: LessonPolicy
  end

  private

  def validated?
    validated_lessons = @validated_lessons.select {|val| val.validated}
    validated_lessons = validated_lessons.map {|val| val.lesson}
    @validated = validated_lessons.include?(@lesson)
  end

  def skipped?
    skipped_lessons = @validated_lessons.reject {|val| val.validated}
    skipped_lessons = skipped_lessons.map {|val| val.lesson}
    @skipped = skipped_lessons.include?(@lesson)
  end

  def first?
    @first = (@book.lessons.first == @lesson)
  end

  def open?
    validated_lessons = @validated_lessons.map {|val| val.lesson}
    prev_lesson = @book.lessons.select {|l| l.id == (@lesson.id - 1)}
    @open = validated_lessons.include?(prev_lesson.first)
  end

  def open_to_unblock?
    validated_lessons = @validated_lessons.map {|val| val.lesson}
    prev_lesson = @book.lessons.select {|l| l.id == (@lesson.id - 2)}
    is_second = (@book.lessons[1].id == @lesson.id)
    @open_to_unblock = is_second || validated_lessons.include?(prev_lesson.first)
  end

  def set_validations
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user)
  end

  def set_lesson
    @lesson = Lesson.includes(:recipe).find(params[:id])
    @book = @lesson.book
  end
end
