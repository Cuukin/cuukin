class RemoveBookReferenceFromLesson < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :book_id
  end
end
