class CreateQuizResults < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz_question, null: false, foreign_key: true
      t.references :quiz_question_option, null: false, foreign_key: true
      t.boolean :is_correct

      t.timestamps
    end
  end
end
