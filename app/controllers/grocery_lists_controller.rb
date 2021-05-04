class GroceryListsController < ApplicationController
  before_action :set_grocery_list

  def show
    authorize @grocery_list, policy_class: GroceryListPolicy
    @ordered_items = @grocery_list.grocery_list_items.group_by { |item| item.ingredient.badge }
  end

  def update
    authorize @grocery_list, policy_class: GroceryListPolicy
    unless grocery_list_params["scheduled_reminder"] == @grocery_list.scheduled_reminder
      @grocery_list.update(grocery_list_params)
      scheduled_time = @grocery_list.scheduled_reminder
      GroceryListReminderJob.set(wait_until: scheduled_time).perform_later(@grocery_list, scheduled_time) if scheduled_time
      redirect_to grocery_list_path(@grocery_list)
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
