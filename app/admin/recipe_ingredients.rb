ActiveAdmin.register RecipeIngredient do

  permit_params :recipe_id, :ingredient_id, :quantity, :unit, :optional

end
