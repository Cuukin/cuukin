class UserRecipesController < ApplicationController
  before_action :set_user_recipe, only: [ :edit, :update, :archive ]

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
    @posts = UserRecipe.where(public: true).select {|post| post.photo.attached?}
    @friends_posts = @posts.select { |post| current_user.is_following?(post.user.id) }
    authorize @posts, policy_class: UserRecipePolicy
  end

  def archive
    authorize @user_recipe, policy_class: UserRecipePolicy
    @user_recipe.update(archive_post_params)
  end

  private

  def set_user_recipe
    @user_recipe = UserRecipe.find(params[:id])
  end

  def user_recipe_params
    params.require(:user_recipe).permit(:difficulcy, :notes, :liked, :photo, :public)
  end

  def archive_post_params
    params.require(:user_recipe).permit(:public)
  end
end
