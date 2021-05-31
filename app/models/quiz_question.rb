class QuizQuestion < ApplicationRecord
  belongs_to :skill_chapter
  has_many :quiz_question_options, dependent: :destroy
  has_many :quiz_results, dependent: :destroy

  has_one_attached :photo
  has_rich_text :answer

  validates :question, :xp, presence: true

  def display_name
    "#{self.skill_chapter.title} - #{self.question}"
  end
end
