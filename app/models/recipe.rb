class Recipe < ApplicationRecord
  validates :title, :description, presence: true
  has_many :lessons
  has_many :recipe_methods, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_tools, dependent: :destroy
end
