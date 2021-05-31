class CreateQuizQuestionOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_question_options do |t|
      t.references :quiz_question, null: false, foreign_key: true
      t.string :option
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
