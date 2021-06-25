class AddBbcFieldsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :bbc, :boolean, null: false, default: false
    add_column :recipes, :rating, :float
    add_column :recipes, :rating_count, :integer
    add_column :recipes, :keywords, :text
    add_column :recipes, :category, :string
    add_column :recipes, :cuisine, :string
    add_column :recipes, :diet, :text, array: true, default: []
    add_column :recipes, :soup, :text
  end
end
