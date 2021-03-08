class Recipe < ApplicationRecord
  validates :title, :photo_url, presence: true
  has_many :lessons # Can't delete a Recipe that's connected to a Lesson
                    # 1st - connect the Lesson to a different Recipe or delete the Lesson
  has_many :recipe_methods, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipe_tools, dependent: :destroy
  has_many :recipe_dietary_restrictions, dependent: :destroy
  has_many :recipe_connections, dependent: :destroy
end
