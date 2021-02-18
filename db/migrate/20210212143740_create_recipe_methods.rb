class CreateRecipeMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_methods do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :video_url

      t.timestamps
    end
  end
end
