class RemoveRecipeFromLesson < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :recipe_id
  end
end
