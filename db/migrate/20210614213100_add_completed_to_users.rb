class AddCompletedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_completed, :boolean, null: false, default: false
  end
end
