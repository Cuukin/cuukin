class DropRecipeMethodIngredients < ActiveRecord::Migration[6.0]
  def change
    drop_table :recipe_method_ingredients
  end
end
