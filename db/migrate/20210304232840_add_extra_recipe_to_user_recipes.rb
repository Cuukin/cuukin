class AddExtraRecipeToUserRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_recipes, :extra_recipe, foreign_key: true, null: true
  end
end
