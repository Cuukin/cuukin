ActiveAdmin.register DietaryRestriction do
  menu parent: "Lists"

  permit_params :name, :icon

  index do
    selectable_column
    # column :id
    column :name
    column :icon
    actions
  end

end
