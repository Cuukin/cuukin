ActiveAdmin.register RecipeIngredient do

  permit_params :recipe_id, :ingredient_id, :measure, :unit, :optional

end
