class DropBookTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :books
  end
end
