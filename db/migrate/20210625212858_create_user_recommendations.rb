class CreateUserRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.text :recipe_list, array: true, default: []

      t.timestamps
    end
  end
end
