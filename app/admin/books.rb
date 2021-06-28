ActiveAdmin.register Book do
  menu parent: "Journey"

  permit_params :title, :description, :xp, :level, :icon_url, :index_reference

  index do
    selectable_column
    # column :id
    column :index_reference
    column :title
    column :description
    column :level
    column :xp
    actions
  end

end
