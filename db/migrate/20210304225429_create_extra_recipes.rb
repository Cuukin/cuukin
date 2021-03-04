class CreateExtraRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :extra_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :title
      t.string :photo_url
      t.string :external_url

      t.timestamps
    end
  end
end
