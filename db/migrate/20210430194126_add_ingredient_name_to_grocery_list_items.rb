class AddIngredientNameToGroceryListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :grocery_list_items, :ingredient_name, :string
  end
end
