class GroceryListReminderJob < ApplicationJob
  queue_as :default

  def perform(grocery_list, scheduled_time)
    if scheduled_time == grocery_list.scheduled_reminder && !grocery_list.grocery_list_items.empty?
      GroceryMailer.grocery_list(grocery_list).deliver_later
      grocery_list.grocery_list_items.each {|item| item.destroy }
      grocery_list.scheduled_time = nil
      grocery_list.save
    end
  end
end
