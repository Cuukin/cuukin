class Lesson < ApplicationRecord
  belongs_to :level
  has_one_attached :photo
  has_many :lesson_skills, dependent: :destroy
  has_many :lesson_badges, through: :lesson_skills
  validates :name, :description, :xp, presence: true
end
