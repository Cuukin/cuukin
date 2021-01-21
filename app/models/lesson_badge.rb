class LessonBadge < ApplicationRecord
  belongs_to :skill
  belongs_to :lesson_skill
  validates :xp, presence: true
end
