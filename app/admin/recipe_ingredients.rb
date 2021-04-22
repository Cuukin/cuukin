ActiveAdmin.register RecipeIngredient do
  menu parent: "Recipe"

  permit_params :recipe_id, :ingredient_id, :quantity, :unit, :optional, :recipe_methods

  index do
    selectable_column
    # column :id
    column :recipe
    column :ingredient
    column :quantity
    column :unit
    column :optional
    column :recipe_methods
    actions
  end

end
