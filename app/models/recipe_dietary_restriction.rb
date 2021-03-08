class RecipeDietaryRestriction < ApplicationRecord
  belongs_to :dietary_restriction
  belongs_to :recipe
end
