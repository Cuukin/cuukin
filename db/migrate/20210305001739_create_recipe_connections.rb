class CreateRecipeConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_connections do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :extra_recipes_titles, array: true

      t.timestamps
    end
  end
end
