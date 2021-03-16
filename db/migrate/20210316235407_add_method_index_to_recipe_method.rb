class AddMethodIndexToRecipeMethod < ActiveRecord::Migration[6.0]
  def change
    add_column :recipe_methods, :method_index, :integer
  end
end
