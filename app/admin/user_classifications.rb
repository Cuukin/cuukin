ActiveAdmin.register UserClassification do
  menu parent: "Recipe Recommendations"

  permit_params :user_id, :recipe_id, :classification

end
