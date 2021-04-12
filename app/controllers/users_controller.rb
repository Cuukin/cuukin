class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update ]

  def index
    @users = User.order(xp: :desc).limit(10)
    authorize @users
    @top_3 = @users.first(3)
    @top_7 = @users - @top_3
  end

  def show
    @user_awards = UserAward.where(user_id: current_user.id).includes(:award)
    @user_badges = UserBadge.where(user_id: current_user.id).includes(:badge).sort_by {|ub| ub.badge.category}
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Your profile has been updated.'
    else
      render :edit
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
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :bio, :username, :weekly_commitment, :motivation => [], :diet_restrictions => [])
  end
end
