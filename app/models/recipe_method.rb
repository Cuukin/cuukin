class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  validates :title, :description, presence: true # add video url here later
  validates :method_index, uniqueness: { scope: :recipe, message: 'Recipe already has this method index' }
end
