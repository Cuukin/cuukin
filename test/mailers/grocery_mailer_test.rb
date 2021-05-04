require 'test_helper'

class GroceryMailerTest < ActionMailer::TestCase
  test "grocery_list" do
    mail = GroceryMailer.grocery_list
    assert_equal "Grocery list", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
