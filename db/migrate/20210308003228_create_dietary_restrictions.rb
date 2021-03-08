class CreateDietaryRestrictions < ActiveRecord::Migration[6.0]
  def change
    create_table :dietary_restrictions do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
