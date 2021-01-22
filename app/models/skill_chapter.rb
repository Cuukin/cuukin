class SkillChapter < ApplicationRecord
  belongs_to :lesson
  has_many :skill_badges, dependent: :destroy
  validates :name, :description, :video_url, presence: true
end
