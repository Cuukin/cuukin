class SkillChapter < ApplicationRecord
  belongs_to :lesson
  validates :title, :description, :video_url, presence: true
end
