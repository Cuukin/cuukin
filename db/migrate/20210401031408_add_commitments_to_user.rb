class AddCommitmentsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :terms_of_service, :boolean, null: false, default: true
    add_column :users, :email_nudges, :boolean, null: false, default: true
    add_column :users, :weekly_commitment, :integer
    add_column :users, :motivation, :string
  end
end
