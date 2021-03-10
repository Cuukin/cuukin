class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.string :bronze
      t.string :white
      t.integer :category

      t.timestamps
    end
  end
end
