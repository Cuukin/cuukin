class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :xp
      t.integer :level

      t.timestamps
    end
  end
end
