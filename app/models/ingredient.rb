class Ingredient < ApplicationRecord
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  enum category: ['fruits', 'fake veggies', 'seeds and grains', 'stem greens',
    'leafy greens', 'bulbs', 'roots', 'herbs', 'bread', 'pasta', 'sweets',
    'fats and oils', 'chicken', 'pork', 'beef', 'fish', 'eggs', 'funghi',
    'seafood', 'dairy', 'seasonings', 'sauces']
end
