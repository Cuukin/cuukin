class LessonSkill < ApplicationRecord
  belongs_to :lesson
  has_many :lesson_badges, dependent: :destroy
  validates :name, :description, :video_url, presence: true
end
