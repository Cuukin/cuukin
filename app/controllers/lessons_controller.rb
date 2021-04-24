class LessonsController < ApplicationController
  before_action :set_lesson, :set_validations

  def show
    validated?
    available?
    skipped?
    locked?

    @lesson_validation = LessonValidation.new
    @user_skill = UserSkill.new

    authorize @lesson, policy_class: LessonPolicy
  end

  private

  def locked?
    first?
    @locked = !(@available || @first || @true)
  end

  def validated?
    @validated = @validated_lessons.include?(@lesson)
  end

  def first?
    @first = (@book.lessons.first == @lesson)
  end

  def available?
    prev_lesson_id = @lesson.id - 1
    unless prev_lesson_id == 0
      @available = @validated_lessons.include?(Lesson.find(prev_lesson_id))
    end
  end

  def skipped?
    @skipped = @skipped_lessons.include?(@lesson)
  end

  def set_validations
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
    @skipped_lessons = LessonValidation.includes(:lesson).where(user: current_user, validated: false).map {|val| val.lesson}
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
    @book = @lesson.book
  end
end
