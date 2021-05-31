ActiveAdmin.register QuizQuestion do
  menu parent: "Quiz"

  permit_params :skill_chapter_id, :question, :photo, :answer, :xp

  index do
    selectable_column
    # column :id
    column :skill_chapter
    column :question
    actions
  end

  form do |f|
    f.inputs do
      f.input :skill_chapter
      f.input :question
      f.input :photo, as: :file
      f.rich_text_area :answer, as: :action_text
      f.input :xp
      f.button :submit
    end
  end

end
