class SkillChapter < ApplicationRecord
  belongs_to :lesson
  validates :name, :description, :video_url, presence: true
end
