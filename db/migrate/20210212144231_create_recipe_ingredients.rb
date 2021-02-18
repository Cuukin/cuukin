class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.integer :measure
      t.string :unit
      t.boolean :optional, null: false, default: false

      t.timestamps
    end
  end
end
