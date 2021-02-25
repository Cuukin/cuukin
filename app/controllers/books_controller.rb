class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    set_book
    set_lessons(@book)
    authorize @lessons, policy_class: BookPolicy

    set_validated_lessons
    @validated_lessons = @lessons.select do |lesson|
      @user_validations_lessons.include?(lesson)
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

  def set_validated_lessons
    user_validations = LessonValidation.joins(:lesson).where(user: current_user).sort_by(&:lesson_id)
    @user_validations_lessons = user_validations.map {|validation| validation.lesson}
  end
end
