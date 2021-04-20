class AddPhotoUrlToUserRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :photo_url, :string
  end
end
