class AddOptionalInformationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :residence_country, :string
    add_column :users, :relationship_status, :string
    add_column :users, :occupation, :string
  end
end
