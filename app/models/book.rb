class Book < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :skill_chapters, through: :lessons

  enum level: [ "dishwasher", "newbie", "chef in progress", "chef of party", "sous chef", "master chef" ]

  validates :title, :description, :xp, presence: true
end
