class RecipeTool < ApplicationRecord
  belongs_to :recipe
  belongs_to :tool

  def display_name
    "#{self.recipe.title} - #{self.tool.name}"
  end
end
