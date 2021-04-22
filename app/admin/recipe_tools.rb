ActiveAdmin.register RecipeTool do
  menu parent: "Recipe"

  permit_params :recipe_id, :tool_id, :recipe_methods

  index do
    selectable_column
    # column :id
    column :recipe
    column :tool
    column :recipe_methods
    actions
  end

end
