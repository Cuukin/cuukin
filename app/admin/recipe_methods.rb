ActiveAdmin.register RecipeMethod do

  permit_params :method_index, :title, :description, :video_url, :recipe_id

end
