class UserRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :recipe, uniqueness: { scope: :user, message: 'This lesson has already been validated' }
end
