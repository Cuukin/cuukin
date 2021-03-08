class CreateRecipeNutritionalInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_nutritional_infos do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :value
      t.string :nutrient

      t.timestamps
    end
  end
end
