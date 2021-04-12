class AddNutriRestrictionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :diet_restrictions, :string
  end
end
