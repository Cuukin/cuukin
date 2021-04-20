class AddIconToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :icon_url, :string
  end
end
