class CreateRecipeMethodIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_method_ingredients do |t|
      t.references :recipe_method, null: false, foreign_key: true
      t.references :recipe_ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
