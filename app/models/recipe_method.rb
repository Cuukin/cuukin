class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  validates :title, :description, :video_url, presence: true
end
