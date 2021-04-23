class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_chapter

  validates :skill_chapter, uniqueness: { scope: :user, message: 'This user already completed this skill chapter' }
end
