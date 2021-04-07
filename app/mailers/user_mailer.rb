class UserMailer < ApplicationMailer
  def nudge
    # REMEMBER TO PUT (user) AS PARAMETER AGAIN BEFORE SAVING!!!
    #@user = user
    #@url = "https://cuukin.herokuapp.com/"

    #mail(to: @user.email, subject: "Let's get Cuukin")
    mail(to: 'julia@gmail.com')
  end
end
