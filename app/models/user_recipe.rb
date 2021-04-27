class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  validates :recipe, uniqueness: { scope: :user, message: 'This user already has this recipe' }
end
