class QuizQuestionOption < ApplicationRecord
  belongs_to :quiz_question

  has_one_attached :photo

  validates :option, presence: true

  def display_name
    "#{self.quiz_question.question} - #{self.option}"
  end
end
