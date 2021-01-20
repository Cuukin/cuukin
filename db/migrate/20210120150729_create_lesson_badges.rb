class CreateLessonBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_badges do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :lesson_skill, null: false, foreign_key: true
      t.integer :xp

      t.timestamps
    end
  end
end
