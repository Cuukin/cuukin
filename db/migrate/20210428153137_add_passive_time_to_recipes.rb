class AddPassiveTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :passive_time, :string
    add_column :recipes, :active_time, :string
  end
end
