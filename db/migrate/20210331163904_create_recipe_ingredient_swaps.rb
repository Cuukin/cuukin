class CreateRecipeIngredientSwaps < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredient_swaps do |t|
      t.references :recipe_ingredient, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :quantity
      t.string :unit

      t.timestamps
    end
  end
end
