class RenameTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :type, :category
  end
end
