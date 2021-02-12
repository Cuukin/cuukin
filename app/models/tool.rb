class Tool < ApplicationRecord
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  enum category: ['pots and pans', 'mechanicals', 'heating',
    'containers', 'cutting', 'utensils', 'disposables', 'refrigerators']
end
