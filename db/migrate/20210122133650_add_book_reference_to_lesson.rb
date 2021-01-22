class AddBookReferenceToLesson < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :book, foreign_key: true, null: false
  end
end
