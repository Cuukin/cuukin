class GroceryListItem < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :ingredient

  # validates :quantity, :unit, presence: true
end
