class GroceryListsController < ApplicationController
  def create
    @grocery_list = GroceryList.new(user: current_user)
  end
end
