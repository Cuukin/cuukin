ActiveAdmin.register LessonValidation do

  permit_params :user_id, :lesson_id, :completed, :difficulcy, :notes, :photo

  form do |f|
    f.inputs do
      f.input :user
      f.input :lesson
      f.input :completed
      f.input :difficulcy
      f.input :notes
      f.input :photo, as: :file
      f.button :submit
    end
  end

end
