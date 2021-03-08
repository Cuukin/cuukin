class RecipeNutritionalInfo < ApplicationRecord
  belongs_to :recipe

  validates :value, :nutrient, presence: true
end
