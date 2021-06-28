class BooksController < ApplicationController
  before_action :set_book, only: [ :show ]
  before_action :set_validations, only: [ :show ]

  def index
    @books = Book.where(index_reference: 1).order(:index_reference).includes(:lessons)
    @validations = LessonValidation.joins(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
    @feedback = Feedback.new
  end

  def show
    authorize @lessons, policy_class: BookPolicy
    @feedback = Feedback.new
  end

  private

  def set_validations
    set_book
    validations = LessonValidation.joins(:lesson).where(user: current_user)
    validations = validations.map {|val| val.lesson}
    @validated_lessons = validations.select {|lesson| lesson.book == @book}
  end

  def set_book
    @book = Book.find(params[:id])
    @lessons = Lesson.where(book_id: @book.id).order(:order_in_book)
  end
end
