class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  validates :difficulcy, presence: true

  after_create :update_completed

  def update_completed
    self.completed = true if self.image.attach
  end
end
