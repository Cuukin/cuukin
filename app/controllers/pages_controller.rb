class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :privacy, :forget ]

  def playground
    user_id = 3
    pyscript_path = Rails.root.join('lib/assets/python/recipe_recommendation.py')
    `python3 #{pyscript_path} #{user_id}`
  end
end
