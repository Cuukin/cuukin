ActiveAdmin.register LessonValidation do
  menu parent: "User"

  permit_params :user_id, :lesson_id, :difficulcy, :notes, :photo

  form do |f|
    f.inputs do
      f.input :user
      f.input :lesson
      f.input :difficulcy
      f.input :notes
      f.input :photo, as: :file
      f.button :submit
    end
  end

  index do
    selectable_column
    # column :id
    column :user
    column :lesson
    column :recipe
    column :validated
    column :difficulcy
    column :notes
    # column :photo, as: :file
    actions
  end

end
