class RenameModels < ActiveRecord::Migration[6.0]
  def change
    rename_table :levels, :books
    rename_table :lesson_skills, :skill_chapters
    rename_table :lesson_badges, :skill_badges
    rename_table :user_lessons, :lesson_validations
  end
end
