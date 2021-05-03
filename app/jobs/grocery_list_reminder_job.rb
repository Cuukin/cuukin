class GroceryListReminderJob < ApplicationJob
  queue_as :default

  def perform(grocery_list)
    unless grocery_list.grocery_list_items.empty?
      GroceryMailer.grocery_list(grocery_list).deliver_later
    end
  end
end
