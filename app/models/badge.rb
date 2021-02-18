class Badge < ApplicationRecord
  has_many :ingredients
  has_many :tools
  has_many :techniques

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  enum category: [ 'tool', 'technique', 'ingredient' ]
end
