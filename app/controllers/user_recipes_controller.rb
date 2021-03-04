class UserRecipesController < ApplicationController
  def index
    @user_recipes = UserRecipe.where(user_id: current_user.id).includes(:recipe)
    authorize @user_recipes, policy_class: UserRecipePolicy
  end
end
