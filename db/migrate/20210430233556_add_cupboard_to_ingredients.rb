class AddCupboardToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :cupboard, :boolean, null: false, default: false
  end
end
