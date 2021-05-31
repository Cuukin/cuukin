ActiveAdmin.register Award do
  menu parent: "Lists"

  permit_params :name, :description, :icon

  index do
    selectable_column
    # column :id
    column :name
    column :description
    column :icon
    actions
  end

end
