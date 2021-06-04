class AddPosterToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :skill_chapters, :poster_url, :string
    add_column :recipe_methods, :poster_url, :string
  end
end
