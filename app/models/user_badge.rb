class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :badge, uniqueness: { scope: :user, message: 'This user already has this badge' }
end
