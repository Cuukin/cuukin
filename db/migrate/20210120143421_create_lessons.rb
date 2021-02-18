class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :xp
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
