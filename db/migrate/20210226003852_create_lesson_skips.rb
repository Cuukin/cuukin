class CreateLessonSkips < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_skips do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :reason

      t.timestamps
    end
  end
end
