namespace :user do
  desc "Checking all users validations and commitments"
  task check_user_commitment: :environment do
    users = User.where.not(weekly_commitment: nil)
    user.each do |user|
      commitment = user.weekly_commitment
      validations = user.lesson_validations.where(validated:true, updated_at: 1.week.ago..Time.now)
      UserMailer.nudge(user).deliver_later if validations.count < commitment
    end
  end
end
