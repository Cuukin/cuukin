namespace :user do
  desc "Checking all users validations and commitments"
  task check_user_commitment: :environment do
    if Date.today.strftime("%A") == "Friday"
      users = User.where.not(weekly_commitment: nil).where(email_nudges: true)
      users.each do |user|
        commitment = user.weekly_commitment
        validations = user.lesson_validations.where(validated:true, updated_at: 1.week.ago..Time.now)
        UserMailer.nudge(user).deliver_later if validations.count < commitment
      end
    end
  end
end
