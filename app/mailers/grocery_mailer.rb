class GroceryMailer < ApplicationMailer

  def grocery_list(grocery_list)
    @grocery = grocery_list
    @user = @grocery.user

    mail(to: @user.email, subject: "Your grocery list")
  end
end
