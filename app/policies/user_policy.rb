class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    owner?
  end

  def update?
    owner?
  end

  def owner?
    record == user
  end
end
