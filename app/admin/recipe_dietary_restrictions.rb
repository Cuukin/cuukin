ActiveAdmin.register RecipeDietaryRestriction do
  menu parent: "Recipe"

  permit_params :recipe_id, :dietary_restriction_id

  index do
    selectable_column
    # column :id
    column :recipe
    column :dietary_restriction_id
    actions
  end

end
