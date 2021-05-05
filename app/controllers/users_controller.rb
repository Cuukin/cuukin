class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update, :profile, :follow, :unfollow ]

  def index
    @users = User.order(xp: :desc).limit(10)
    authorize @users
    @top_3 = @users.first(3)
    @top_7 = @users - @top_3
  end

  def show
    authorize @user
    @users = User.where.not(id: current_user.id) # to test response on follow and unfollow
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to profile_user_path(@user), notice: 'Your profile has been updated.'
    else
      render :edit
    end
  end

  def profile
    authorize @user
    @user_awards = UserAward.where(user: current_user).includes(:award)
    @user_badges = UserBadge.where(user: current_user).group_by {|ub| ub.badge.category}
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  def commitment
    @user = current_user
    authorize @user
  end

  def create_commitment
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :commitment
    end
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :bio, :username, :weekly_commitment, :motivation => [], :diet_restrictions => [])
  end
end
