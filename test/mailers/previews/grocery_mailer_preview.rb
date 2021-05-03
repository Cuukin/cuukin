# Preview all emails at http://localhost:3000/rails/mailers/grocery_mailer
class GroceryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/grocery_mailer/grocery_list
  def grocery_list
    GroceryMailer.grocery_list
  end

end
