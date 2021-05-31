class QuizResult < ApplicationRecord
  belongs_to :user
  belongs_to :quiz_question
  belongs_to :quiz_question_option

  validates :quiz_question, uniqueness: { scope: :user, message: 'This question has already been answered' }

  after_create :set_result

  private

  def set_result
    if self.quiz_question_option.is_correct
      self.is_correct = true
      self.save
      self.user.xp += self.quiz_question.xp
      self.user.save
    end
  end
end
