class UserMailer < ApplicationMailer
  def nudge(user)
    @user = user
    @photo = LessonValidation.where(user: user).last.recipe.photo_url
    @url = "https://cuukin.herokuapp.com/"

    mail(to: @user.email, subject: "Let's get Cuukin")
  end
end
