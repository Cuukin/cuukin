class AddBookIndexToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :index_reference, :boolean
  end
end
