class CreateTechniques < ActiveRecord::Migration[6.0]
  def change
    create_table :techniques do |t|
      t.string :name
      t.integer :score_1
      t.integer :score_2
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
