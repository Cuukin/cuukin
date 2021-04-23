class CreateUserSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill_chapter, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
