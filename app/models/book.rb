class Book < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :skill_chapters, through: :lessons

  enum level: { newbie: 0, chef_in_progress: 1, chef_of_party: 2, sous_chef: 3, master_chef: 4 }

  validates :title, :description, :xp, presence: true
end
