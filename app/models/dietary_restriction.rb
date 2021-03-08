class DietaryRestriction < ApplicationRecord
  has_many :recipe_dietary_restrictions

  validates :name, :icon, presence: true
end
