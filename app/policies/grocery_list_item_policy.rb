class GroceryListItemPolicy < ApplicationPolicy
  def create?
    record.user == user
  end

  def destroy?
    record.grocery_list.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
