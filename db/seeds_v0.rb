require 'csv'
require 'json'

# Badges

# filepath = 'badges.json'
# serialized = File.read(Rails.root.join("lib", "seeds", "#{filepath}"))
# # serialized = eval(serialized)
# badges = JSON.parse(serialized)

# badges.each do |badge|
#   new_badge = Badge.new(badge)
#   # new_badge.save
#   puts "Created - #{new_badge.name} - #{new_badge.category}"
# end

# Badges CSV

badges_csv = File.read(Rails.root.join('lib', 'seeds', 'badges.csv'))
badges_csv = CSV.parse(badges_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Creating Badges... ✨"

badges_csv.each do |row|
  b = Badge.new
  # b.id = row['Id']
  b.name = row['Name']
  b.category = row['Category']
  b.description = row['Description']
  b.icon = row['Icon']
  b.bronze = row['Bronze']
  b.white = row['White']
  b.save!
  puts "Created Badge - #{b.name}"
end

# Awards

# filepath = 'awards.json'
# serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
# awards = JSON.parse(serialized)

# awards.each do |award|
#   new_award = Award.new(award)
#   # new_award.save
#   puts "Created - #{new_award.name}"
# end

# Tools
puts "✨ Creating Tools... ✨"

filepath = 'tools.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
tools = JSON.parse(serialized)

tools.each do |tool|
  tool.except!("id")
  new_tool = Tool.new(tool)
  new_tool.save!
  puts "Created - #{new_tool.name} - #{new_tool.badge.name}"
end

# Ingredients
puts "✨ Creating Ingredients... ✨"

filepath = 'ingredients.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
ingredients = JSON.parse(serialized)

ingredients.each do |ingredient|
  ingredient.except!("id")
  new_ingredient = Ingredient.new(ingredient)
  new_ingredient.save!
  puts "Created - #{new_ingredient.name} - #{new_ingredient.badge.name}"
end

# Techniques
puts "✨ Creating Techniques... ✨"

filepath = 'techniques.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
techniques = JSON.parse(serialized)

techniques.each do |technique|
  technique.except!("id")
  new_technique = Technique.new(technique)
  new_technique.save!
  puts "Created - #{new_technique.name} - #{new_technique.badge.name}"
end

# Books
puts puts "✨ Creating Books... ✨"

filepath = 'books.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
books = JSON.parse(serialized)

books.each do |book|
  book.except!("id")
  new_book = Book.new(book)
  new_book.save!
  puts "Created - #{new_book.title}"
end

# Recipes
puts "✨ Creating Recipes... ✨"

filepath = 'recipes.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipes = JSON.parse(serialized)

recipes.each do |recipe|
  recipe.except!("id")
  new_recipe = Recipe.new(recipe)
  new_recipe.save!
  puts "Created - #{new_recipe.title}"
end

# Lessons
puts "✨ Creating Lessons... ✨"

filepath = 'lessons.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
lessons = JSON.parse(serialized)

lessons.each do |lesson|
  lesson.except!("id")
  new_lesson = Lesson.new(lesson)
  new_lesson.save!
  puts "Created - #{new_lesson.title}"
end

# Skill Chapters
puts "✨ Creating Skill Chapters... ✨"

filepath = 'skill_chapters.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
skill_chapters = JSON.parse(serialized)

skill_chapters.each do |skill_chapter|
  skill_chapter.except!("id")
  new_skill_chapter = SkillChapter.new(skill_chapter)
  new_skill_chapter.save!
  puts "Created - #{new_skill_chapter.title}"
end

# Lesson Recipes
puts "✨ Creating Recipes... ✨"

filepath = 'lesson_recipes.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
lesson_recipes = JSON.parse(serialized)

lesson_recipes.each do |lesson_recipe|
  lesson_recipe.except!("id")
  new_lesson_recipe = LessonRecipe.new(lesson_recipe)
  new_lesson_recipe.save!
  puts "Created - #{new_lesson_recipe.recipe.title} - #{new_lesson_recipe.lesson.title}"
end

# Recipe Methods
puts "✨ Creating Recipe Methods... ✨"

filepath = 'recipe_methods.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_methods = JSON.parse(serialized)

recipe_methods.each do |recipe_method|
  recipe_method.except!("id")
  new_recipe_method = RecipeMethod.new(recipe_method)
  new_recipe_method.save!
  puts "Created - #{new_recipe_method.title} - #{new_recipe_method.recipe.title}"
end

# Recipe Ingredients
puts "✨ Creating Recipe Ingredients... ✨"

filepath = 'recipe_ingredients.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_ingredients = JSON.parse(serialized)

recipe_ingredients.each do |recipe_ingredient|
  recipe_ingredient.except!("id")
  if recipe_ingredient["ingredient_id"] > Ingredient.last.id
    recipe_ingredient["ingredient_id"] = 1
    new_recipe_ingredient = RecipeIngredient.new(recipe_ingredient)
  else
    new_recipe_ingredient = RecipeIngredient.new(recipe_ingredient)
  end
  new_recipe_ingredient.save!
  puts "Created - #{new_recipe_ingredient.recipe.title} - #{new_recipe_ingredient.ingredient.name}"
end

# Recipe Tools
puts "✨ Creating Tools... ✨"

filepath = 'recipe_tools.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_tools = JSON.parse(serialized)

recipe_tools.each do |recipe_tool|
  recipe_tool.except!("id")
  new_recipe_tool = RecipeTool.new(recipe_tool)
  new_recipe_tool.save!
  puts "Created - #{new_recipe_tool.recipe.title} - #{new_recipe_tool.tool.name}"
end

# Recipe Techniques
puts "✨ Creating Recipe Techniques... ✨"

filepath = 'recipe_techniques.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_techniques = JSON.parse(serialized)

recipe_techniques.each do |recipe_technique|
  recipe_technique.except!("id")
  new_recipe_technique = RecipeTechnique.new(recipe_technique)
  new_recipe_technique.save!
  puts "Created - #{new_recipe_technique.recipe.title} - #{new_recipe_technique.technique.name}"
end

# Recipe Ingredient Swaps
puts "✨ Creating Recipe Ingredient Swaps... ✨"

filepath = 'recipe_ingredient_swaps.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_ingredient_swaps = JSON.parse(serialized)

recipe_ingredient_swaps.each do |recipe_ingredient_swap|
  recipe_ingredient_swap.except!("id")
  new_recipe_ingredient_swap = RecipeIngredientSwap.new(recipe_ingredient_swap)
  new_recipe_ingredient_swap.save!
  puts "Created - #{new_recipe_ingredient_swap.recipe_ingredient.display_name} - #{new_recipe_ingredient_swap.ingredient.name}"
end

# Recipe Nutritional Infos
puts "✨ Creating Recipe Nutritional Infos... ✨"

filepath = 'recipe_nutritional_infos.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_nutritional_infos = JSON.parse(serialized)

recipe_nutritional_infos.each do |recipe_nutritional_info|
  recipe_nutritional_info.except!("id")
  new_recipe_nutritional_info = RecipeNutritionalInfo.new(recipe_nutritional_info)
  new_recipe_nutritional_info.save!
  puts "Created - #{new_recipe_nutritional_info.recipe.title} - #{new_recipe_nutritional_info.value} - #{new_recipe_nutritional_info.nutrient}"
end

# Dietary Restrictions
puts "✨ Creating Dietary Restrictions... ✨"

# filepath = 'dietary_restrictions.json'
# serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
# dietary_restrictions = JSON.parse(serialized)

# dietary_restrictions.each do |dietary_restriction|
#   new_dietary_restriction = DietaryRestriction.new(dietary_restriction)
#   new_dietary_restriction.save!
#   puts "Created - #{new_dietary_restriction.name}"
# end

dietary_restrictions_csv = File.read(Rails.root.join('lib', 'seeds', 'dietary_restrictions.csv'))
dietary_restrictions_csv = CSV.parse(dietary_restrictions_csv, :headers => true, :encoding => 'ISO-8859-1')

dietary_restrictions_csv.each do |row|
  dr = DietaryRestriction.new
  dr.name = row['Name']
  dr.icon = row['Icon']
  dr.save!
  puts "Created DIETARY RESTRICTION - #{dr.name}"
end

# Recipe Dietary Restrictions
puts "✨ Creating Recipe Dietary Restrictions... ✨"

filepath = 'recipe_dietary_restrictions.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_dietary_restrictions = JSON.parse(serialized)

recipe_dietary_restrictions.each do |recipe_dietary_restriction|
  recipe_dietary_restriction.except!("id")
  new_recipe_dietary_restriction = RecipeDietaryRestriction.new(recipe_dietary_restriction)
  new_recipe_dietary_restriction.save!
  puts "Created - #{new_recipe_dietary_restriction.recipe.title} - #{new_recipe_dietary_restriction.dietary_restriction.name}"
end

# Admin Users + MVP Awards

"✨ Creating Users... ✨"

helena = {
  admin: true,
  first_name: 'Helena',
  username: 'helena',
  email: 'helenad.mim2021@london.edu',
  password: 'cuukin2020'
}

faris = {
  admin: true,
  first_name: 'Faris',
  username: 'faris',
  email: 'fraucci.mba2022@london.edu',
  password: 'cuukin2020'
}

guilherme = {
  admin: true,
  first_name: 'Guilherme',
  username: 'guilherme',
  email: 'guilhermevmanhaes@gmail.com',
  password: 'cuukin2020'
}

wanmeng = {
  admin: true,
  first_name: 'Wanmeng',
  username: 'wanmeng',
  email: 'wzhang.mba2022@london.edu',
  password: 'cuukin2020'
}

elie = {
  admin: true,
  first_name: 'Elie',
  username: 'elie',
  email: 'emhanna.mba2021@london.edu',
  password: 'cuukin2020'
}

ricardo = {
  admin: true,
  first_name: 'Ricardo',
  username: 'ricardo',
  email: 'ricardob.mba2021@london.edu',
  password: 'cuukin2020'
}

julia = {
  admin: true,
  first_name: 'Julia',
  username: 'julia',
  email: 'ricardob.mba2021@london.edu',
  password: 'cuukin2020'
}

admin_users = [helena, faris, guilherme, wanmeng, elie, ricardo]

admin_users.each do |admin|
  user = User.new(admin)
  user.skip_confirmation!
  user.save!
  puts "Created #{admin[:first_name]}."
end

puts "Remember them to confirm their emails and change their password 🍕"

# Awards

award_1 = {
  name: "Sizzlin' Hot",
  description: "You cooked 3+ recipes this week!
Keep it up to keep this award badge",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815614/Cuukin%20-%20Awards/award-sizzlin_hy3yzi.svg"
}

award_2 = {
  name: "Cuukin up a Storm",
  description: "A storm is brewing...
You visited Cuukin for 3 days in a row, keep it coming to not lose this award!",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815614/Cuukin%20-%20Awards/award-storm_alb40e.svg"
}

award_3 = {
  name: "Bookworm",
  description: "But like, a cute one, like Hermione!
You finished all the books of Cuukin v1.0. Congrats! More will come and we will inform you when they do!",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815614/Cuukin%20-%20Awards/award-worm_seqtdd.svg"
}

award_4 = {
  name: "Fire Dancer",
  description: "You have mastered all Cuukin v1.0 heating techniques -- like a cool(ass) fire dancer.",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815612/Cuukin%20-%20Awards/award-fire_o24654.svg"
}

award_5 = {
  name: "Not a recipe virgin",
  description: "Congrats, first recipe is now done and dusted.
Wasn't that bad right?!",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815612/Cuukin%20-%20Awards/award-first_tggawv.svg"
}

award_6 = {
  name: "First book",
  description: "Just like our first love, we will remember you dearly.
Congrats on finishing the first book!",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815612/Cuukin%20-%20Awards/award-book_jqy52w.svg"
}

award_7 = {
  name: "Supporter",
  description: "Thank you for making a donation to our Patreon site. Kin sends his love.
xoxoxx
Kin",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815612/Cuukin%20-%20Awards/award-patreon_edny9i.svg"
}

award_8 = {
  name: "Oh hi there!",
  description: "This is your first ever log in, welcome my future chef!
Have this award, you deserve it.",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815612/Cuukin%20-%20Awards/award-login_dueama.svg"
}

award_9 = {
  name: "Samurai",
  description: "You have mastered all the chopping techniques in Cuukin v1.0 -- quite impressive!
You would make a stellar samurai...",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1614815614/Cuukin%20-%20Awards/award-samurai_mgycxs.svg"
}

awards = [award_1, award_2, award_3, award_4, award_5, award_6, award_7, award_8, award_9]

awards.each do |award|
  new_award = Award.create(award)
  puts "Created award #{award[:name]} 👏"
end

# Reward users with Oh hi there! award

all_users = User.all

all_users.each do |user|
  UserAward.create(award: Award.find_by(name: 'Oh hi there!'), user: user)
end

# BBC Recipes

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
