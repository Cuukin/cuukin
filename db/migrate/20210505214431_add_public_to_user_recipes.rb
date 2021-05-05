class AddPublicToUserRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :public, :boolean, null: false, default: true
    add_column :lesson_validations, :public, :boolean, null: false, default: true
  end
end
