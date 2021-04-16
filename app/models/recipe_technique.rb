class RecipeTechnique < ApplicationRecord
  belongs_to :recipe
  belongs_to :technique

  def display_name
    "#{self.recipe.title} - #{self.technique.name}"
  end
end
