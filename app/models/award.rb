class Award < ApplicationRecord
  validates :name, :description, :icon, presence: true
end
