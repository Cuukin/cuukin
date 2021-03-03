class Award < ApplicationRecord
  validates :title, :description, :icon, presence: true
end
