class UserSignIn < ApplicationRecord
  belongs_to :user

  validates :sign_in_date, presence: true
end
