class UpdateDatabaseIds < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :level_id
    add_reference :lessons, :book, foreign_key: true, null: false
    remove_column :skill_badges, :lesson_skill_id
    add_reference :skill_badges, :skill_chapter, foreign_key: true, null: false
  end
end
