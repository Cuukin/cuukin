class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_chapter

  include PgSearch::Model
  pg_search_scope :skill_search,
    associated_against: {
      skill_chapter: :title
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :skill_chapter, uniqueness: { scope: :user, message: 'This user already completed this skill chapter' }

  after_create :set_result

  private

  def set_result
    self.user.xp += 10
    self.user.save
  end
end
