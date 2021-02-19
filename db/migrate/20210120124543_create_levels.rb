class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :name
      t.text :description
      t.integer :xp, null: false, default: 0

      t.timestamps
    end
  end
end
