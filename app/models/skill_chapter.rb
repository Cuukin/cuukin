class SkillChapter < ApplicationRecord
  belongs_to :lesson
  belongs_to :badge

  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills
  has_many :quiz_questions

  validates :title, presence: true
end
