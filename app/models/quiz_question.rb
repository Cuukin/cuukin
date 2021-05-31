class QuizQuestion < ApplicationRecord
  belongs_to :skill_chapter

  has_one_attached :photo
  has_rich_text :answer

  validates :question, :xp, presence: true
end
