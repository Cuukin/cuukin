class CreateRecipeDietaryRestrictions < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_dietary_restrictions do |t|
      t.references :dietary_restriction, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
