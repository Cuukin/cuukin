ActiveAdmin.register RecipeTool do
  menu parent: "Recipe"

  permit_params :recipe_id, :tool_id

  index do
    selectable_column
    # column :id
    column :recipe
    column :tool
    actions
  end

end
