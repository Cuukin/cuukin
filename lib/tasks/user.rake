namespace :user do
  desc "Checking all users validations and commitments"
  task check_user_commitment: :environment do
    users = User.where.not(weekly_commitment: nil).where(email_nudges: true)
    users.each do |user|
      commitment = user.weekly_commitment
      validations = user.lesson_validations.where(validated:true, updated_at: 1.week.ago..Time.now)
      if (validations.count < commitment) && (Date.today.strftime("%A") == "Tuesday" || Date.today.strftime("%A") == "Friday")
        UserMailer.nudge(user).deliver_later
      end
    end
  end
end
