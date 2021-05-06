class UserRecipesController < ApplicationController
  before_action :set_user_recipe, only: [ :edit, :update ]

  def index
    @completed_recipes = UserRecipe.where(user_id: current_user.id, completed: true).includes(:recipe)
    @unlocked_recipes = UserRecipe.where(user_id: current_user.id, completed: false).includes(:recipe)
    authorize @completed_recipes, policy_class: UserRecipePolicy
  end

  def edit
    authorize @user_recipe, policy_class: UserRecipePolicy
  end

  def update
    authorize @user_recipe, policy_class: UserRecipePolicy
    if @user_recipe.update(user_recipe_params)
      TransitionRecipeStarsJob.perform_later(current_user, @user_recipe)
      @user_recipe.completed = true
      @user_recipe.save
      redirect_to user_recipes_path
    else
      render :edit
    end
  end

  def feed
    @user_recipes = UserRecipe.all.select {|ur| ur.photo.attached?}
    @friends_user_recipes = @user_recipes.select { |ur| current_user.is_following?(ur.user.id) }
    authorize @user_recipes, policy_class: UserRecipePolicy
  end

  private

  def set_user_recipe
    @user_recipe = UserRecipe.find(params[:id])
  end

  def user_recipe_params
    params.require(:user_recipe).permit(:difficulcy, :notes, :liked, :photo, :public)
  end
end
