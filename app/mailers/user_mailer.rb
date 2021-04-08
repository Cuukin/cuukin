class UserMailer < ApplicationMailer
  def nudge(user)
    @user = user
    @url = "https://cuukin.herokuapp.com/"

    mail(to: @user.email, subject: "Let's get Cuukin")
  end
end
