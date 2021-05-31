ActiveAdmin.register QuizQuestionOption do
  menu parent: "Quiz"

  permit_params :quiz_question_id, :option, :is_correct, :photo

  index do
    selectable_column
    # column :id
    column :quiz_question
    column :option
    column :is_correct
    actions
  end

  form do |f|
    f.inputs do
      f.input :quiz_question
      f.input :option
      f.input :photo, as: :file
      f.input :is_correct
      f.button :submit
    end
  end

end
