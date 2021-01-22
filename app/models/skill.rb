class Skill < ApplicationRecord
  has_one_attached :photo
  has_many :skill_badges
  validates :name, presence: true
end
