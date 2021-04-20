class UserRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  validates :recipe, uniqueness: { scope: :user, message: 'This user already has this recipe' }
end
