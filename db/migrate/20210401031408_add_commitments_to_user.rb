class AddCommitmentsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :privacy_check, :boolean, null: false, default: true
    add_column :users, :email_check, :boolean, null: false, default: false
    add_column :users, :weekly_commitment, :integer
  end
end
