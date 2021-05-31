class GroceryListsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_grocery_list

  def show
    @feedback = Feedback.new
    # authorize @grocery_list, policy_class: GroceryListPolicy
    @ordered_items = @grocery_list.grocery_list_items.group_by { |item| item.ingredient.badge }
  end

  def update
    authorize @grocery_list, policy_class: GroceryListPolicy

    if @grocery_list.update(grocery_list_params)
      time_zone = grocery_list_params['scheduled_reminder'].in_time_zone(params[:query]).formatted_offset.to_i
      scheduled_time = @grocery_list.scheduled_reminder + -time_zone.hours
      items = @grocery_list.grocery_list_items.as_json
      GroceryListReminderJob.set(wait_until: scheduled_time).perform_later(@grocery_list, items, scheduled_time) unless items.empty?
      redirect_to grocery_list_path(@grocery_list)
    end
  end

  def destroy
    @list = GroceryList.find(params[:id])
    authorize @list, policy_class: GroceryListPolicy
    # @list.grocery_list_items.each {|item| item.destroy}
    # @list.scheduled_reminder = nil
    new_list = GroceryList.new(user: current_user)
    redirect_to grocery_list_path(new_list) if new_list.save
    # redirect_to grocery_list_path(new_list) if @list.destroy
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
