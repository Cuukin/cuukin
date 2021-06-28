class Recipe < ApplicationRecord
  has_many :recipe_methods, dependent: :destroy
  has_many :recipe_nutritional_infos, dependent: :destroy

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_tools, dependent: :destroy
  has_many :recipe_techniques, dependent: :destroy
  has_many :recipe_dietary_restrictions, dependent: :destroy

  has_many :ingredients, through: :recipe_ingredients
  has_many :tools, through: :recipe_tools
  has_many :techniques, through: :recipe_techniques
  has_many :dietary_restrictions, through: :recipe_dietary_restrictions

  has_one :lesson_recipe
  has_one :lesson, through: :lesson_recipe
  has_many :user_recipes

  validates :title, :photo_url, presence: true
end
