class RecipeIngredientSwap < ApplicationRecord
  belongs_to :recipe_ingredient
  belongs_to :ingredient
end
