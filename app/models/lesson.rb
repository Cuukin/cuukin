class Lesson < ApplicationRecord
  belongs_to :book

  has_many :skill_chapters, dependent: :destroy
  has_many :lesson_validations
  has_many :lesson_unblocks

  has_many :lesson_recipes, dependent: :destroy
  has_many :recipes, through: :lesson_recipes

  validates :title, :xp, presence: true
end
