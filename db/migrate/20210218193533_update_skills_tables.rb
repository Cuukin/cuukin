class UpdateSkillsTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :badge, foreign_key: true, null: false
    add_reference :tools, :badge, foreign_key: true, null: false
    add_column :ingredients, :score_1, :integer, default: 0
    add_column :ingredients, :score_2, :integer, default: 0
    add_column :ingredients, :score_3, :integer, default: 0
    add_column :tools, :score_1, :integer, default: 0
    add_column :tools, :score_2, :integer, default: 0
    add_column :tools, :score_3, :integer, default: 0
  end
end
