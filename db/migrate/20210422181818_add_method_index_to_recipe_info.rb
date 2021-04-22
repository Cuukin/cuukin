class AddMethodIndexToRecipeInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_ingredients, :recipe_methods, :string
    add_column :recipe_tools, :recipe_methods, :string
  end
end
