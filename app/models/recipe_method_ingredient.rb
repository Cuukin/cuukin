class RecipeMethodIngredient < ApplicationRecord
  belongs_to :recipe_method
  belongs_to :recipe_ingredient

  validates :recipe_method, uniqueness: { scope: :recipe_ingredient, message: 'This method already has this recipe ingredient' }
end
