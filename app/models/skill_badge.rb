class SkillBadge < ApplicationRecord
  belongs_to :skill
  belongs_to :skill_chapter
  validates :xp, presence: true
end
