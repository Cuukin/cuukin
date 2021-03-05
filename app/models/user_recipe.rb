class UserRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :recipe, uniqueness: { scope: :user, message: 'This user already has this recipe' }
end
