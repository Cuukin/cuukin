ActiveAdmin.register Feedback do
  menu parent: "User"

  index do
    selectable_column
    # column :id
    column :user
    column :email
    column :page_params
    column :description
    actions
  end

end
