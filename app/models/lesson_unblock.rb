class LessonUnblock < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :lesson, uniqueness: { scope: :user, message: 'This lesson has already been unblocked' }
end
