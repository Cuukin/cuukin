class AddLevelToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :level, :integer
  end
end
