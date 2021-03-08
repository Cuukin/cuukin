class Lesson < ApplicationRecord
  belongs_to :book
  belongs_to :recipe
  has_many :skill_chapters, dependent: :destroy
  has_many :lesson_validations
  has_many :lesson_unblocks

  validates :title, :xp, presence: true
end
