class AddOrderToLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :order_in_book, :integer
  end
end
