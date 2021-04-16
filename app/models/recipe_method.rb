class RecipeMethod < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_method_ingredients

  validates :title, :description, :method_index, presence: true # add video url here later
  validates :method_index, uniqueness: { scope: :recipe, message: 'Recipe already has this method index' }

  def display_name
    "#{self.recipe.title} - #{self.title}"
  end
end
