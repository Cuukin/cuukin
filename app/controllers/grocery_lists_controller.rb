class GroceryListsController < ApplicationController
  before_action :set_grocery_list

  def show
    authorize @grocery_list, policy_class: GroceryListPolicy
  end

  private

  def set_grocery_list
    # list = GroceryList.find_by(user: current_user)
    # @grocery_list = list ? list : GroceryList.create(user: current_user)
    @grocery_list = GroceryList.find(params[:id])
  end
end
