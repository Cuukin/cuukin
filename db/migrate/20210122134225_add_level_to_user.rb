class AddLevelToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :level, :integer, null: false, default: 0
  end
end
