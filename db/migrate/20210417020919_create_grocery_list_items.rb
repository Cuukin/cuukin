class CreateGroceryListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :grocery_list_items do |t|
      t.references :grocery_list, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :quantity
      t.string :unit

      t.timestamps
    end
  end
end
