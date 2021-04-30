class GroceryListItem < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :ingredient

  # validates :quantity, :unit, presence: true
  validates :user, uniqueness: true
end
