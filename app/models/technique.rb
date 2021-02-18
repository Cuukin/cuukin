class Technique < ApplicationRecord
  belongs_to :badge
  has_many :recipe_techniques

  validates :name, :score_1, :score_2, presence: true
  validates :name, uniqueness: true
end
