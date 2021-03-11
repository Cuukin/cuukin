class RecipeDietaryRestriction < ApplicationRecord
  belongs_to :dietary_restriction
  belongs_to :recipe

  validates :dietary_restriction, uniqueness: { scope: :recipe, message: 'Dietary Restriction already belongs to this Recipe' }
end
