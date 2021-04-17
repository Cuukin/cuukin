ActiveAdmin.register SkillChapter do
  menu parent: "Lesson"

  permit_params :title, :description, :video_url, :lesson_id

  index do
    selectable_column
    # column :id
    column :title
    column :lesson
    column :video_url
    column :badge
    actions
  end

end
