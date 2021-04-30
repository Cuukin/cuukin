class GroceryListsController < ApplicationController
  before_action :set_grocery_list

  def show
    authorize @grocery_list, policy_class: GroceryListPolicy
    # @items = @grocery_list.grocery_list_items.includes(:ingredients).includes(:badges).order("ingredients.badge_id desc")
    #@items = items.includes(:ingredient).order("ingredients.badge desc")
  end

  def destroy
    @list = GroceryList.find(params[:id])
    authorize @list, policy_class: GroceryListPolicy
    @list.grocery_list_items.each {|item| item.destroy}
  end

  private

  def set_grocery_list
    # list = GroceryList.find_by(user: current_user)
    # @grocery_list = list ? list : GroceryList.create(user: current_user)
    @grocery_list = GroceryList.find(params[:id])
  end
end
