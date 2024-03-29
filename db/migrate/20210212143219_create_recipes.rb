class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :photo_url
      t.string :external_url
      t.string :prep_time

      t.timestamps
    end
  end
end
