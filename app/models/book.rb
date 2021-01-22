class Book < ApplicationRecord
  has_one_attached :photo
  has_many :lessons, dependent: :destroy
  has_many :skills_chapters, through: :lessons
  validates :name, :description, :xp, presence: true
end
