class Ingredient < ApplicationRecord
  validates :name, :type, presence: true
  validates :name, uniqueness: true
  enum type: ['fuit', 'fake veggie', 'seeds and grain', 'stem greens',
    'leafy greens', 'bulbs', 'roots', 'herbs', 'bread', 'pasta', 'sweets',
    'fats and oils', 'chicken', 'pork', 'beef', 'fish', 'eggs', 'funghi',
    'seafood', 'dairy', 'seasonings', 'sauces']
end
