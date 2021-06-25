class CreateUserClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_classifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :classification

      t.timestamps
    end
  end
end
