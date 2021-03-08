class CreateRecipeTechniques < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_techniques do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :technique, null: false, foreign_key: true

      t.timestamps
    end
  end
end
