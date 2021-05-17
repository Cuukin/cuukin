class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_chapter

  validates :skill_chapter, uniqueness: { scope: :user, message: 'This user already completed this skill chapter' }

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      skill_chapter: [:title, :description],
      lesson: :title
    },
    using: {
      tsearch: { prefix: true }
    }
end
