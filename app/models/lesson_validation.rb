class LessonValidation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  validates :difficulcy, :photo, presence: true
  validates :lesson, uniqueness: { scope: :user, message: 'This lesson has already been validated' }

  after_create :update_completed

  def update_completed
    self.completed = true if self.photo.attached?
    self.user.touch
    self.save
  end
end
