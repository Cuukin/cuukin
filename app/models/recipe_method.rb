class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  validates :title, :description, presence: true # add video url here later
end
