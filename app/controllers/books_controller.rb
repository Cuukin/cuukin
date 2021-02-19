class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @lessons = Lesson.where(book_id: @book.id).includes(:recipe)
    authorize @lessons, policy_class: BookPolicy
  end
end
