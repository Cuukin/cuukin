class UserRecipesController < ApplicationController
  before_action :set_user_recipe, only: [ :edit, :update, :archive ]

  def index
    @unlocked_recipes = UserRecipe.where(user_id: current_user.id, completed: false).includes(:recipe)
    @completed_recipes = UserRecipe.where(user_id: current_user.id, completed: true).includes(:recipe)

    if params[:query].present?
      @search_recipes = UserRecipe.global_search(params[:query]).select {|user_recipe| user_recipe.user == current_user}
      respond_to do |format|
        format.js { render partial: 'search_results'}
      end
    end

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
    @posts = UserRecipe.where(public: true).order(updated_at: :desc).select {|post| post.photo.attached?}
    @friends_posts = @posts.select { |post| current_user.is_following?(post.user.id) }
    authorize @posts, policy_class: UserRecipePolicy
  end

  def archive
    authorize @user_recipe, policy_class: UserRecipePolicy
    if @user_recipe.update(archive_post_params)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :archive }
      end
    end
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
