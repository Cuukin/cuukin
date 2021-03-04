class UserAwardsController < ApplicationController
  def index
    @user_awards = UserAward.where(user_id: current_user.id).includes(:award)
    authorize @user_awards, policy_class: UserAwardPolicy
  end
end