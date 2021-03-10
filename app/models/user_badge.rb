class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :badge, uniqueness: { scope: :user, message: 'This user already has this badge' }

  enum medal: { bronze: 0, silver: 1, gold: 2 }

  before_save :update_medal

  def update_medal
    if self.xp > 200
      self.medal = 'silver'
    end
  end
end
