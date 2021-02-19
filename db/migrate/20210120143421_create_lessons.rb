class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :xp, null: false, default: 0
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
