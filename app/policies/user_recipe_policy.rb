class UserRecipePolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    record.user == user && !record.completed
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
