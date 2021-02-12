class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  validates :description, :video_url, presence: true
end
