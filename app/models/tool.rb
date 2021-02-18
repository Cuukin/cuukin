class Tool < ApplicationRecord
  belongs_to :badge
  has_many :recipe_tools

  validates :name, :score_1, :score_2, :suggested_product, presence: true
  validates :name, uniqueness: true
end
