ActiveAdmin.register RecipeMethodIngredient do
  menu parent: "Recipe"

  permit_params :recipe_method_id, :recipe_ingredient_id

  index do
    selectable_column
    # column :id
    column :recipe_method
    column :recipe_ingredient
    actions
  end

end
