ActiveAdmin.register RecipeIngredientSwap do

  permit_params :recipe_ingredient_id, :ingredient_id, :quantity, :unit


  form do |f|
    f.inputs do
      f.input :recipe_ingredient
      f.input :ingredient, collection: Ingredient.order('name ASC')
      f.input :quantity
      f.input :unit
      f.button :submit
    end
  end

end
