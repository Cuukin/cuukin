class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  validates :title, :method_index, presence: true
  validates :method_index, uniqueness: { scope: :recipe, message: 'Recipe already has this method index' }

  def display_name
    "#{self.recipe.title} - #{self.title}"
  end
end
