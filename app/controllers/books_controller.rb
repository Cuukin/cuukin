class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    set_book
    set_lessons(@book)
    authorize @lessons, policy_class: BookPolicy

    set_validated_lessons(@lessons)

    unless @validated_lessons.empty?
      last_validated_lesson = @validated_lessons.last
      last_validated_lesson_index = @validated_lessons.find_index(last_validated_lesson)
      @open_lesson = [@lessons[last_validated_lesson_index + 1]]
    end

    @blocked_lessons = @lessons.reject do |lesson|
      @validated_lessons.include?(lesson)
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_lessons(book)
    set_book
    @lessons = Lesson.where(book_id: book.id).includes(:recipe)
  end

  def set_validated_lessons(lessons)
    user_validations = LessonValidation.joins(:lesson).where(user: current_user).sort_by(&:lesson_id)
    user_validations_lessons = user_validations.map {|validation| validation.lesson}

    @validated_lessons = lessons.select do |lesson|
      user_validations_lessons.include?(lesson)
    end
  end
end
