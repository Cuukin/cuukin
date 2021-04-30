class GroceryListItemsController < ApplicationController
  before_action :set_grocery_list

  def create
    @grocery_list_item = GroceryListItems.new(grocery_list_item_params)
    if @grocery_list.ingredients.include?(@grocery_list_item.ingredient)
      existing_item = @grocery_list.grocery_list_items.find_by(ingredient: @grocery_list_item.ingredient)
      existing_item.quantity += @grocery_list_item.quantity if existing_item.unit == @grocery_list_item.unit
      existing_item.save
    else
      @grocery_list_item.grocery_list = @grocery_list
      @grocery_list_item.save
    end
  end

  private

  def set_grocery_list
    list = GroceryList.find_by(user: current_user)
    @grocery_list = list ? list : GroceryList.create(user: current_user)
  end

  def grocery_list_item_params
    params.require(:grocery_list_item).permit(:ingredient_id, :quantity, :unit)
  end
end
