class SkillChapter < ApplicationRecord
  belongs_to :lesson
  belongs_to :badge

  validates :title, :description, :video_url, presence: true
end
