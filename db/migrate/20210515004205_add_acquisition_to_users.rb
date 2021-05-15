class AddAcquisitionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :acquisition, :string
  end
end
