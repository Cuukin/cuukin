class UserBadgesController < ApplicationController
  def index
    @user_badges = UserBadge.where(user_id: current_user.id).includes(:badge)
    authorize @user_badges, policy_class: UserBadgePolicy
  end

  def show
    @user_badge = UserBadge.find(params[:id])
    authorize @user_badge, policy_class: UserBadgePolicy
  end
end
