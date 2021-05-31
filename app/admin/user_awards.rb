ActiveAdmin.register UserAward do
  menu parent: "User"

  permit_params :user_id, :award_id

  index do
    selectable_column
    # column :id
    column :user
    column :award
    actions
  end

end
