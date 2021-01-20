class Level < ApplicationRecord
  has_one_attached :photo
  has_many :lessons, , dependent: :destroy
  has_many :lesson_skills, through: :lessons
end
