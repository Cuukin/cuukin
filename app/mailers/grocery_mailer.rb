class GroceryMailer < ApplicationMailer

  def grocery_list(list_items, user)
    @list_items = list_items
    @user = user

    mail(to: @user.email, subject: "Your grocery list")
  end
end
