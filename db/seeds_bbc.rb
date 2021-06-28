require 'csv'
require 'json'

bbc_recipes_csv = File.read(Rails.root.join('lib', 'seeds', 'bbc_recipes.csv'))
bbc_recipes_csv = CSV.parse(bbc_recipes_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Seeding BBC Recipes... ✨"

bbc_recipes_csv.each do |row|
  unless row['imageLink']
    row['imageLink'] = "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/creamy_mushroom_pasta_41818_16x9.jpg"
  end

  recipe = Recipe.new
  recipe.title = row['title']
  recipe.description = row['description']
  recipe.photo_url = row['imageLink']
  recipe.external_url = row['recipeLink']
  recipe.keywords = row['keywords']
  recipe.category = row['recipeCategory']
  recipe.cuisine = row['recipeCuisine']
  recipe.soup = row['soup']
  recipe.rating = row['ratingValue'].to_f
  recipe.rating_count = row['ratingCount'].to_i
  recipe.diet = row['suitableForDiet']
  recipe.bbc = true
  recipe.save!

  puts "Created BBC Recipe - #{recipe.title}"
end
