class GroceryListItemsController < ApplicationController
  before_action :set_grocery_list

  def create
    @grocery_list_item = GroceryListItem.new(grocery_list_item_params)
    authorize @grocery_list, policy_class: GroceryListItemPolicy
    ingredient = Ingredient.find_by(name: @grocery_list_item.ingredient_name)
    if @grocery_list.ingredients.include?(ingredient)
      existing_item = @grocery_list.grocery_list_items.find_by(ingredient: ingredient)
      existing_item.quantity = existing_item.quantity.to_i + @grocery_list_item.quantity.to_i if existing_item.unit == @grocery_list_item.unit
      existing_item.save
    else
      @grocery_list_item.ingredient = ingredient
      @grocery_list_item.grocery_list = @grocery_list
      @grocery_list_item.save
    end
  end

  def destroy
    @item = GroceryListItem.find(params[:id])
    authorize @item, policy_class: GroceryListItemPolicy
    @item.destroy
    if @grocery_list.grocery_list_items.count == 0
      @grocery_list.scheduled_reminder = nil
      @grocery_list.save
    end
  end

  private

  def set_grocery_list
    list = GroceryList.find_by(user: current_user)
    @grocery_list = list ? list : GroceryList.create(user: current_user)
  end

  def grocery_list_item_params
    params.require(:grocery_list_item).permit(:ingredient_name, :quantity, :unit)
  end
end
