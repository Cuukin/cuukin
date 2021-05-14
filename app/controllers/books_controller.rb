class BooksController < ApplicationController
  before_action :set_book, only: [ :show ]
  before_action :set_validations, only: [ :index, :show ]

  def index
    @books = Book.where(id: 1).order(:id).includes(:lessons)
    @validations = LessonValidation.joins(:lesson).where(user: current_user, validated: true).map {|val| val.lesson}
    @feedback = Feedback.new
  end

  def show
    skipped_lessons(@validations)
    validated_lessons(@validations)
    authorize @lessons, policy_class: BookPolicy
  end

  private

  def skipped_lessons(validations)
    skipped_lessons = validations.reject {|val| val.validated}
    @skipped = skipped_lessons.map {|val| val.lesson}
  end

  def validated_lessons(validations)
    validated_lessons = validations.select {|val| val.validated}
    @validated = validated_lessons.map {|val| val.lesson}
  end

  def set_validations
    @validations = LessonValidation.joins(:lesson).where(user: current_user)
    @validated_lessons = @validations.map {|val| val.lesson}
  end

  def set_book
    @book = Book.find(params[:id])
    @lessons = Lesson.where(book_id: @book.id).order(:id)
  end
end
