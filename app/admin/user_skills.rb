ActiveAdmin.register UserSkill do
  menu parent: "User"

  permit_params :user_id, :skill_chapter_id, :completed

  form do |f|
    f.inputs do
      f.input :user
      f.input :skill_chapter
      f.input :completed
      f.button :submit
    end
  end

  index do
    selectable_column
    # column :id
    column :user
    column :skill_chapter
    column :completed
    actions
  end
end
