class RenameVideoColumnFromLessonSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :lesson_skills, :video_id, :string
    add_column :lesson_skills, :video_url, :string
  end
end
