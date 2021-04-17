ActiveAdmin.register RecipeMethod do
  menu parent: "Recipe"

  permit_params :method_index, :title, :description, :video_url, :recipe_id

  index do
    selectable_column
    # column :id
    column :title
    column :method_index
    column :recipe
    column :video_url
    actions
  end

end
