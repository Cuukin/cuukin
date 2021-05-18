class Badge < ApplicationRecord
  has_many :ingredients
  has_many :tools
  has_many :techniques

  # has_many :skill_chapters
  # has_many :user_skills, through: :skill_chapters

  validates :name, :category, presence: true
  validates :name, uniqueness: true

  enum category: [ 'tool', 'technique', 'ingredient' ]
end
