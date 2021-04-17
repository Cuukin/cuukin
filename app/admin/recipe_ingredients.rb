ActiveAdmin.register RecipeIngredient do
  menu parent: "Recipe"

  permit_params :recipe_id, :ingredient_id, :quantity, :unit, :optional

  index do
    selectable_column
    # column :id
    column :recipe
    column :ingredient
    column :quantity
    column :unit
    column :optional
    actions
  end

end
