class CreateUserLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :user_lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.boolean :validated, null: false, default: false
      t.integer :difficulcy
      t.text :notes

      t.timestamps
    end
  end
end
