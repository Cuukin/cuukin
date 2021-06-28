class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :privacy, :forget ]

  def playground
    user_id = 1
    `python3 lib/assets/python/recipe_recommendation.py "#{user_id}"`
  end
end
