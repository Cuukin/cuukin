class AddBadgeReferenceToSkillChapter < ActiveRecord::Migration[6.0]
  def change
    add_reference :skill_chapters, :badge, foreign_key: true, null: false
  end
end
