class CreateLessonSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_skills do |t|
      t.string :name
      t.text :description
      t.string :video_id
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
