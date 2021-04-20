class LessonValidationPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    record.user == user && !record.validated
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
