class BadgesController < ApplicationController
  def show
    @badge = Badge.find(params[:id])
    authorize @badge, policy_class: BadgePolicy
  end
end
