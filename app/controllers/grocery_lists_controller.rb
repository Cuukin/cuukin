class GroceryListsController < ApplicationController
  before_action :set_grocery_list

  def show
    authorize @grocery_list, policy_class: GroceryListPolicy
    # @items = @grocery_list.grocery_list_items.includes(:ingredients).includes(:badges).order("ingredients.badge_id desc")
    #@items = items.includes(:ingredient).order("ingredients.badge desc")
  end

  def update
    authorize @grocery_list, policy_class: GroceryListPolicy
    if @grocery_list.update(grocery_list_params)
      redirect_to grocery_list_path(@grocery_list)
      GroceryListReminderJob.set(wait_until: @grocery_list.scheduled_reminder).perform_later(@grocery_list)
    end
  end

  def destroy
    @list = GroceryList.find(params[:id])
    authorize @list, policy_class: GroceryListPolicy
    @list.grocery_list_items.each {|item| item.destroy}
    @list.scheduled_reminder = nil
    redirect_to grocery_list_path(@grocery_list) if @list.save
  end

  private

  def set_grocery_list
    # list = GroceryList.find_by(user: current_user)
    # @grocery_list = list ? list : GroceryList.create(user: current_user)
    @grocery_list = GroceryList.find(params[:id])
  end

  def grocery_list_params
    params.require(:grocery_list).permit(:scheduled_reminder)
  end
end
