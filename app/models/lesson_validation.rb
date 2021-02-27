class LessonValidation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  # validates :difficulcy, :photo, presence: true
  validates :lesson, uniqueness: { scope: :user, message: 'This lesson has already been validated' }

  # after_create :update_status

  # after_create :transition_currencies

  # def transition_currencies
  #   self.user.touch
  # end

  # def update_status
    # Method is called whenever a lesson validation is created
    # If the lesson validation has a photo, the completed column is updated to true
    # and the user instance is touched - to call the user's callback methods
    # self.status = self.photo.attached? ? 'validated' : 'skipped'
    # self.user.touch
    # self.save
  # end
end
