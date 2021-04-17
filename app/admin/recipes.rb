ActiveAdmin.register Recipe do
  menu parent: "Recipe"

  permit_params :title, :description, :prep_time, :photo_url

  index do
    selectable_column
    # column :id
    column :title
    column :prep_time
    column :photo_url
    actions
  end

end
