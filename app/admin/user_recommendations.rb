ActiveAdmin.register UserRecommendation do
  menu parent: "Recipe Recommendations"

  permit_params :user_id, :recipe_list

end
