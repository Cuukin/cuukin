class QuizResult < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_question
  belongs_to :quiz_question_option

  validates :is_correct, presence: true
  validates :quiz_question, uniqueness: { scope: :user, message: 'This question has already been answered' }
end
