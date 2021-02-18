class UpdateSkillsTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :badge, foreign_key: true, null: false
    add_reference :tools, :badge, foreign_key: true, null: false
    add_column :ingredients, :score_1, :integer
    add_column :ingredients, :score_2, :integer
    add_column :tools, :score_1, :integer
    add_column :tools, :score_2, :integer
  end
end
