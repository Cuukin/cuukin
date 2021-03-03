class UserAwardsController < ApplicationController
  def index
    @user_awards = UserAward.joins(:award).where(user_id: current_user.id)
    authorize @user_awards, policy_class: UserAwardPolicy
  end
end
