class SkillChapter < ApplicationRecord
  belongs_to :lesson
  belongs_to :badge

  has_many :user_skills, dependent: :destroy

  validates :title, presence: true
end
