class CreateUserSignIns < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sign_ins do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :sign_in_date

      t.timestamps
    end
  end
end
