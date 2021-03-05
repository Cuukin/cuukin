class LessonValidationPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    !record.validated
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
