class Equipment < ApplicationRecord
  validates :name, :type, presence: true
  validates :name, uniqueness: true
  enum type: ['pots and pans', 'mechanicals', 'heating',
    'containers', 'cutting', 'utensils', 'disposables', 'refrigerators']
end
