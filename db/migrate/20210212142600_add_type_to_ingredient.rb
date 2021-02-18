class AddTypeToIngredient < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :type, :integer
  end
end
