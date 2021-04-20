class AddInfoToUserRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :difficulcy, :integer
    add_column :user_recipes, :notes, :text
    add_column :user_recipes, :like, :boolean
  end
end
