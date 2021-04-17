ActiveAdmin.register RecipeTechnique do
  menu parent: "Recipe"

  permit_params :recipe_id, :technique_id

  index do
    selectable_column
    # column :id
    column :recipe
    column :technique
    actions
  end

end
