class BookPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
