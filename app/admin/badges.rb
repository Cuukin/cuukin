ActiveAdmin.register Badge do
  menu parent: "Lists"

  permit_params :name, :description, :category, :icon, :bronze, :white

  index do
    selectable_column
    # column :id
    column :name
    column :description
    column :icon
    column :category
    actions
  end

end
