ActiveAdmin.register Book do
  menu parent: "Journey"

  permit_params :title, :description, :xp, :level, :icon_url

  index do
    selectable_column
    # column :id
    column :title
    column :description
    column :level
    column :xp
    actions
  end

end
