class GroceryListReminderJob < ApplicationJob
  queue_as :default

  def perform(grocery_list, list_items, scheduled_time)
    GroceryMailer.grocery_list(list_items, grocery_list.user).deliver_later
    if Time.now >= scheduled_time
      grocery_list.scheduled_reminder = nil
      grocery_list.save
    end
  end
end
