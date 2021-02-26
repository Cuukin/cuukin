class Lesson < ApplicationRecord
  belongs_to :book
  belongs_to :recipe
  has_one_attached :photo # change this to photo url as string later
  has_many :skill_chapters, dependent: :destroy

  validates :title, :description, :xp, presence: true
end
