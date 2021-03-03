class UserAwardPolicy < ApplicationPolicy
  def index?
    record.user = user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
