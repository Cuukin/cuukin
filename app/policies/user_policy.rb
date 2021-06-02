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

  def commitment?
    create_commitment?
  end

  def create_commitment?
    user.sign_in_count <= 1
  end

  def update_currency?
    record == user
  end

  def profile?
    owner?
  end

  def owner?
    record == user
  end
end
