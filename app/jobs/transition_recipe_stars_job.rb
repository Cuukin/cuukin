class TransitionRecipeStarsJob < ApplicationJob
  queue_as :default

  def perform(user, user_recipe)
    if user_recipe.photo.attached?
      user.xp += 60
    else
      user.xp += 30
    end
    user.save
  end
end
