class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :badge, uniqueness: { scope: :user, message: 'This user already has this badge' }

  enum medal: { white: 0, bronze: 1, silver: 2, gold: 3 }

  before_save :update_medal

  def update_medal
    if self.xp >= 50
      self.medal = 'gold'
    elsif self.xp >= 25
      self.medal = 'silver'
    elsif self.xp >= 5
      self.medal = 'bronze'
    else
      self.medal = 'white'
    end
  end
end
