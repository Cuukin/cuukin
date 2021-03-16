ActiveAdmin.register RecipeMethod do

  permit_params :title, :description, :video_url, :recipe_id, :method_index

end
