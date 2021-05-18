class UserRecipePolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    record.user == user && !record.completed
  end

  def feed?
    true
  end

  def archive?
    record.user == user
  end

  def completed_recipes?
    true
  end

  def unlocked_recipes?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
