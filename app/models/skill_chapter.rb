class SkillChapter < ApplicationRecord
  belongs_to :lesson
  belongs_to :badge

  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  validates :title, presence: true
end
