class UserRecommendation < ApplicationRecord
  belongs_to :user

  validates :recipe_list, presence: true
end
