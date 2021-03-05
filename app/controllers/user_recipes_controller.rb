class UserRecipesController < ApplicationController
  def index
    @completed_recipes = UserRecipe.where(user_id: current_user.id, completed: true).includes(:recipe)
    @unlocked_recipes = UserRecipe.where(user_id: current_user.id, completed: false).includes(:recipe)
    authorize @completed_recipes, policy_class: UserRecipePolicy
  end
end
