class AddCuukiesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cuukies, :integer, default: 0, null: false
    add_column :users, :xp, :integer, default: 0, null: false
  end
end
