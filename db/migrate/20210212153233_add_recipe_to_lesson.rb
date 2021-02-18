class AddRecipeToLesson < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :recipe, foreign_key: true, null: false
  end
end
