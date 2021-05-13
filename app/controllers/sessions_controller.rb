class SessionsController < Devise::SessionsController
  def create
    super do |resource|
      CreateUserSignInJob.perform_later(resource)
    end
  end
end
