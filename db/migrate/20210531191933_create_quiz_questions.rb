class CreateQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.string :question
      t.integer :xp, null: false, default: 10
      t.references :skill_chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
