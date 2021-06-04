require 'csv'
require 'json'

# Badges
puts "Badges"

filepath = 'badges.json'
serialized = File.read(Rails.root.join("lib", "seeds", "#{filepath}"))
badges = JSON.parse(serialized)

badges.each do |badge|
  new_badge = Badge.new(badge)
  # new_badge.save
  puts "Created - #{new_badge.name} - #{new_badge.category}"
end

# Awards
puts "Awards"

filepath = 'awards.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
awards = JSON.parse(serialized)

awards.each do |award|
  new_award = Award.new(award)
  # new_award.save
  puts "Created - #{new_award.name}"
end

# Tools
puts "Tools"

filepath = 'tools.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
tools = JSON.parse(serialized)

tools.each do |tool|
  new_tool = Tool.new(tool)
  # new_tool.save
  puts "Created - #{new_tool.name} - #{new_tool.badge.name}"
end

# Ingredients
puts "Ingredients"

filepath = 'ingredients.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
ingredients = JSON.parse(serialized)

ingredients.each do |ingredient|
  new_ingredient = Ingredient.new(ingredient)
  # new_ingredient.save
  puts "Created - #{new_ingredient.name} - #{new_ingredient.badge.name}"
end

# Techniques
puts "Techniques"

filepath = 'techniques.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
techniques = JSON.parse(serialized)

techniques.each do |technique|
  new_technique = Technique.new(technique)
  # new_technique.save
  puts "Created - #{new_technique.name} - #{new_technique.badge.name}"
end

# Books
puts "Books"

filepath = 'books.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
books = JSON.parse(serialized)

books.each do |book|
  new_book = Book.new(book)
  # new_book.save
  puts "Created - #{new_book.title}"
end

# Recipes
puts "Recipes"

filepath = 'recipes.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipes = JSON.parse(serialized)

recipes.each do |recipe|
  new_recipe = Recipe.new(recipe)
  # new_recipe.save
  puts "Created - #{new_recipe.title}"
end

# Lessons
puts "Lessons"

filepath = 'lessons.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
lessons = JSON.parse(serialized)

lessons.each do |lesson|
  new_lesson = Lesson.new(lesson)
  # new_lesson.save
  puts "Created - #{new_lesson.title}"
end

# Skill Chapters
puts "Skill Chapters"

filepath = 'skill_chapters.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
skill_chapters = JSON.parse(serialized)

skill_chapters.each do |skill_chapter|
  new_skill_chapter = SkillChapter.new(skill_chapter)
  # new_skill_chapter.save
  puts "Created - #{new_skill_chapter.title}"
end

# Lesson Recipes
puts "Lesson Recipes"

filepath = 'lesson_recipes.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
lesson_recipes = JSON.parse(serialized)

lesson_recipes.each do |lesson_recipe|
  new_lesson_recipe = LessonRecipe.new(lesson_recipe)
  # new_lesson_recipe.save
  puts "Created - #{new_lesson_recipe.recipe.title} - #{new_lesson_recipe.lesson.title}"
end

# Recipe Methods
puts "Recipe Methods"

filepath = 'recipe_methods.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_methods = JSON.parse(serialized)

recipe_methods.each do |recipe_method|
  new_recipe_method = RecipeMethod.new(recipe_method)
  # new_recipe_method.save
  puts "Created - #{new_recipe_method.title} - #{new_recipe_method.recipe.title}"
end

# Recipe Ingredients
puts "Recipe Ingredients"

filepath = 'recipe_ingredients.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_ingredients = JSON.parse(serialized)

recipe_ingredients.each do |recipe_ingredient|
  new_recipe_ingredient = RecipeIngredient.new(recipe_ingredient)
  # new_recipe_ingredient.save
  puts "Created - #{new_recipe_ingredient.recipe.title} - #{new_recipe_ingredient.ingredient.name}"
end

# Recipe Tools
puts "Recipe Tools"

filepath = 'recipe_tools.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_tools = JSON.parse(serialized)

recipe_tools.each do |recipe_tool|
  new_recipe_tool = RecipeTool.new(recipe_tool)
  # new_recipe_tool.save
  puts "Created - #{new_recipe_tool.recipe.title} - #{new_recipe_tool.tool.name}"
end

# Recipe Techniques
puts "Recipe Technique"

filepath = 'recipe_techniques.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_techniques = JSON.parse(serialized)

recipe_techniques.each do |recipe_technique|
  new_recipe_technique = RecipeTechnique.new(recipe_technique)
  # new_recipe_technique.save
  puts "Created - #{new_recipe_technique.recipe.title} - #{new_recipe_technique.technique.name}"
end

# Recipe Ingredient Swaps
puts "Recipe Ingredient Swaps"

filepath = 'recipe_ingredient_swaps.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_ingredient_swaps = JSON.parse(serialized)

recipe_ingredient_swaps.each do |recipe_ingredient_swap|
  new_recipe_ingredient_swap = RecipeIngredientSwap.new(recipe_ingredient_swap)
  # new_recipe_ingredient_swap.save
  puts "Created - #{new_recipe_ingredient_swap.recipe_ingredient.display_name} - #{new_recipe_ingredient_swap.ingredient.name}"
end

# Recipe Nutritional Infos
puts "Recipe Nutritional Info"

filepath = 'recipe_nutritional_infos.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_nutritional_infos = JSON.parse(serialized)

recipe_nutritional_infos.each do |recipe_nutritional_info|
  new_recipe_nutritional_info = RecipeNutritionalInfo.new(recipe_nutritional_info)
  # new_recipe_nutritional_info.save
  puts "Created - #{new_recipe_nutritional_info.recipe.title} - #{new_recipe_nutritional_info.value} - #{new_recipe_nutritional_info.nutrient}"
end

# Dietary Restrictions
puts "Dietary Restrictions"

filepath = 'dietary_restrictions.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
dietary_restrictions = JSON.parse(serialized)

dietary_restrictions.each do |dietary_restriction|
  new_dietary_restriction = DietaryRestriction.new(dietary_restriction)
  # new_dietary_restriction.save
  puts "Created - #{new_dietary_restriction.name}"
end

# Recipe Dietary Restrictions
puts "Recipe Dietary Restrictions"

filepath = 'recipe_dietary_restrictions.json'
serialized = File.read(Rails.root.join('lib', 'seeds', "#{filepath}"))
recipe_dietary_restrictions = JSON.parse(serialized)

recipe_dietary_restrictions.each do |recipe_dietary_restriction|
  new_recipe_dietary_restriction = RecipeDietaryRestriction.new(recipe_dietary_restriction)
  # new_recipe_dietary_restriction.save
  puts "Created - #{new_recipe_dietary_restriction.recipe.title} - #{new_recipe_dietary_restriction.dietary_restriction.name}"
end

# Admin Users + MVP Awards

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

admin_users = [helena, faris, guilherme, wanmeng, elie, ricardo]

admin_users.each do |admin|
  user = User.new(admin)
  user.skip_confirmation!
  user.save!
  puts "Created #{admin[:first_name]}."
end

puts "Remember them to confirm their emails and change their password 🍕"

# Reward users with Oh hi there! award

all_users = User.all

all_users.each do |user|
  UserAward.create(award: Award.find_by(name: 'Oh hi there!'), user: user)
end
