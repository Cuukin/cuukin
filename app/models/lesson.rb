class Lesson < ApplicationRecord
  belongs_to :book
  belongs_to :recipe
  has_one_attached :photo # change this to photo url as string later
  has_many :skill_chapters, dependent: :destroy
  has_many :skill_badges, through: :skill_chapters
  validates :name, :description, :xp, presence: true
end
