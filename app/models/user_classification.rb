class UserClassification < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  enum classification: { dislike: 0, like: 1, love: 2 }
  validates :classification, presence: true

  validate :must_be_bbc_recipe

  def must_be_bbc_recipe
    errors.add(:bbc_recipe, "must be a bbc recipe") unless recipe.bbc
  end
end
