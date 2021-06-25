class UserClassification < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  enum classification: { dislike: 0, like: 1, love: 2 }
  validates :classification, presence: true
end
