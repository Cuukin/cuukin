class Lesson < ApplicationRecord
  belongs_to :book
  has_one_attached :photo
  has_many :skill_chapters, dependent: :destroy
  has_many :skill_badges, through: :skill_chapters
  validates :name, :description, :xp, presence: true
end
