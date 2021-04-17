ActiveAdmin.register RecipeNutritionalInfo do
  menu parent: "Recipe"

  permit_params :recipe_id, :value, :nutrient

  index do
    selectable_column
    # column :id
    column :recipe
    column :value
    column :nutrient
    actions
  end

end
