class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  has_many :recipe_ingredient_swaps

  def display_name
    "#{self.recipe.title} - #{self.ingredient.name}"
  end
end
