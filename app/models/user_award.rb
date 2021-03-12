class UserAward < ApplicationRecord
  belongs_to :user
  belongs_to :award

  validates :award, uniqueness: { scope: :user, message: 'This user already has this Award' }
end
