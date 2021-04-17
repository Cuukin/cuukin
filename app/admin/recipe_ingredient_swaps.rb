ActiveAdmin.register RecipeIngredientSwap do
  menu parent: "Recipe"

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

  index do
    selectable_column
    # column :id
    column :recipe_ingredient
    column :ingredient
    column :quantity
    column :unit
    actions
  end

end
