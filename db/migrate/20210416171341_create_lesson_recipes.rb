class CreateLessonRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_recipes do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.boolean :extra, null: false, default: false

      t.timestamps
    end
  end
end
