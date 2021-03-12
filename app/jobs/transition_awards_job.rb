class TransitionAwardsJob < ApplicationJob
  queue_as :default

  def perform(user)
    user_validations = LessonValidation.where(user: user, completed: true)

    # book_one_awards
    if user_validations >= 4
      UserAward.create(user: user, award: Award.find_by(name: 'Fire Dancer')) # heating techniques from MVP
      UserAward.create(user: user, award: Award.find_by(name: 'Samurai')) # chopping techniques from MVP
      UserAward.create(user: user, award: Award.find_by(name: 'First book')) # finished book 1
    end

    # first_recipe
    if user_validations >= 1
      UserAward.create(user: user, award: Award.find_by(name: 'Not a recipe virgin'))
    end

    # book_two_awards
    if user_validations >= 8
      UserAward.create(user: user, award: Award.find_by(name: 'Bookworm'))
    end

    # strike_awards
    if user_validations.last(3)[2].updated_at - user_validations.last(3)[0].updated_at < 6.days
      UserAward.create(user: user, award: Award.find_by(name: "Sizzlin' Hot"))
    end
  end
end
