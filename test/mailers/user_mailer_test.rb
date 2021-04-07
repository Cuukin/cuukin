require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "nudge" do
    mail = UserMailer.nudge
    assert_equal "Nudge", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
