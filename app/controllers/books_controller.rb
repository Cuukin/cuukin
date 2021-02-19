class BooksController < ApplicationController
  def show
    @book = Book.find(1) # using this instead of params id temporarily
    @lessons = Lesson.where(book_id: @book.id).includes(:recipe)
    authorize @lessons, policy_class: BookPolicy
  end
end
