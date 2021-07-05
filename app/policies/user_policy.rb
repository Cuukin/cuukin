class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    owner?
  end

  def onboarding?
    create_onboarding?
  end

  def create_onboarding?
    user.sign_in_count <= 1
    owner?
  end

  def update_currency?
    owner?
  end

  def profile?
    owner?
  end

  def owner?
    record == user
  end
end
