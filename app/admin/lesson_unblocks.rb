ActiveAdmin.register LessonUnblock do
  menu parent: "User"

  permit_params :user_id, :lesson_id, :reason, :other_reason

  index do
    selectable_column
    column :id
    column :user
    column :lesson
    column :reason
    column :other_reason
    actions
  end

end
