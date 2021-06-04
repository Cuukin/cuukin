ActiveAdmin.register SkillChapter do
  menu parent: "Lesson"

  permit_params :title, :description, :video_url, :poster_url, :lesson_id

  index do
    selectable_column
    # column :id
    column :title
    column :lesson
    column :video_url
    column :badge
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :lesson
      f.input :description
      f.input :video_url
      f.input :poster_url
      f.button :submit
    end
  end

end
