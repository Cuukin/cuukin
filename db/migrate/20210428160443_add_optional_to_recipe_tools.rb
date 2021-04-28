class AddOptionalToRecipeTools < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_tools, :optional, :boolean, null: false, default: false
  end
end
