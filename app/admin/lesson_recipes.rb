ActiveAdmin.register LessonRecipe do
  menu parent: "Lesson"

  permit_params :recipe_id, :lesson_id, :extra

  index do
    selectable_column
    # column :id
    column :lesson
    column :recipe
    column :extra
    actions
  end

end
