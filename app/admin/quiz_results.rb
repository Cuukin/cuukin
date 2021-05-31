ActiveAdmin.register QuizResult do
  menu parent: "Quiz"

  permit_params :quiz_question_id, :user_id, :quiz_question_option_id, :is_correct

  index do
    selectable_column
    # column :id
    column :quiz_question
    column :user
    column :quiz_question_option
    column :is_correct
    actions
  end

end
