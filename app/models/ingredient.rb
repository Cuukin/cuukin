class Ingredient < ApplicationRecord
  belongs_to :badge
  has_many :recipe_ingredients

  has_one_attached :photo
  has_rich_text :content

  validates :name, :score_1, :score_2, presence: true
  validates :name, uniqueness: true
end
