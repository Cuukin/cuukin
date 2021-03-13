class SkillChapter < ApplicationRecord
  belongs_to :lesson
  belongs_to :badge

  validates :title, presence: true
  # add description and video url with presence true later
end
