class CreateUserSignInJob < ApplicationJob
  queue_as :default

  def perform(user)
    new_user_sign_in = UserSignIn.new(user: user)
    new_user_sign_in.sign_in_date = Time.now
    new_user_sign_in.save
  end
end
