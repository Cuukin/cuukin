require 'csv'

# Badges

badges_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'badges.csv'))
badges_csv = CSV.parse(badges_csv, :headers => true, :encoding => 'ISO-8859-1')

badges_csv.each do |row|
  b = Badge.new
  b.name = row['badge_name']
  b.category = row['category']
  b.description = row['description']
  b.icon = row['icon']
  b.bronze = row['bronze']
  b.white = row['white']
  b.save
  puts "Created BADGE - #{b.name}"
end

# Tools

tools_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'tools.csv'))
tools_csv = CSV.parse(tools_csv, :headers => true, :encoding => 'ISO-8859-1')

tools_csv.each do |row|
  t = Tool.new
  t.name = row['name']
  t.badge = Badge.find_by(name: "#{row['badge_name']}")
  t.suggested_product = row['buy_url']
  t.score_1 = row['score1']
  t.score_2 = row['score2']
  t.save
  puts "Created TOOL - #{t.name}"
end

# Ingredients

ingredients_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'ingredients.csv'))
ingredients_csv = CSV.parse(ingredients_csv, :headers => true, :encoding => 'ISO-8859-1')

ingredients_csv.each do |row|
  i = Ingredient.new
  i.name = row['name']
  i.badge = Badge.find_by(name: "#{row['badge_name']}")
  i.score_1 = row['score1']
  i.score_2 = row['score2']
  i.save
  puts "Created INGREDIENT - #{i.name}"
end

# Techniques

techniques_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'techniques.csv'))
techniques_csv = CSV.parse(techniques_csv, :headers => true, :encoding => 'ISO-8859-1')

techniques_csv.each do |row|
  t = Technique.new
  t.name = row['name']
  t.badge = Badge.find_by(name: "#{row['badge_name']}")
  t.score_1 = row['score1']
  t.score_2 = row['score2']
  t.save
  puts "Created TECHNIQUE - #{t.name}"
end

# Dietary Restrictions Listing

dietary_restrictions_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'dietary_restrictions.csv'))
dietary_restrictions_csv = CSV.parse(dietary_restrictions_csv, :headers => true, :encoding => 'ISO-8859-1')

dietary_restrictions_csv.each do |row|
  dr = DietaryRestriction.new
  dr.name = row['restriction_name']
  dr.icon = row['icon']
  dr.save
  puts "Created DIETARY RESTRICTION - #{dr.name}"
end


# Books

book_1 = {
  title: 'Kitchen SOS',
  description: "New to cooking? Don't worry, we got your back. These basic recipes are a perfect starting point.",
  level: 'newbie',
  xp: 500
}

book_2 = {
  title: 'Kitchen basics',
  description: "You have the essentials down, lets move onto some new recipes. Don't worry, we're taking it easy on you still!",
  level: 'newbie',
  xp: 500
}

books = [book_1, book_2]

books.each do |book|
  new_book = Book.create(book)
  puts "Created #{book[:title]} 📗"
end


# Recipes

recipes_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipes.csv'))
recipes_csv = CSV.parse(recipes_csv, :headers => true, :encoding => 'ISO-8859-1')

recipes_csv.each do |row|
  r = Recipe.new
  r.title = row['title']
  r.prep_time = "#{row['prep_time']} min"
  r.photo_url = row['photo_url']
  r.photo_url = row['external_url']
  r.save
  puts "Created RECIPE - #{r.title}"
end

# Recipe Ingredients

recipe_ingredients_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_ingredients.csv'))
recipe_ingredients_csv = CSV.parse(recipe_ingredients_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_ingredients_csv.each do |row|
  r = RecipeIngredient.new
  r.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  r.ingredient = Ingredient.find_by(name: "#{row['ingredient_name'].titlecase}")
  r.quantity = row['measure']
  r.unit = row['unit']
  r.optional = row['optional']
  r.save
  puts "Created RECIPE INGREDIENT - #{r.ingredient.name} for #{r.recipe.title}"
end

# Recipe Tools

recipe_tools_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_tools.csv'))
recipe_tools_csv = CSV.parse(recipe_tools_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_tools_csv.each do |row|
  r = RecipeTool.new
  r.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  r.tool = Tool.find_by(name: "#{row['tool_name'].titlecase}")
  r.save
  puts "Created RECIPE TOOL - #{r.tool.name} for #{r.recipe.title}"
end


# Recipe Techniques

recipe_techniques_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_techniques.csv'))
recipe_techniques_csv = CSV.parse(recipe_techniques_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_techniques_csv.each do |row|
  r = RecipeTechnique.new
  r.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  r.technique = Technique.find_by(name: "#{row['technique_name'].titlecase}")
  r.save
  puts "Created RECIPE TECHNIQUE - #{r.technique.name} for #{r.recipe.title}"
end

# Recipe Nutritional Data

recipe_nutritional_data_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_nutritional_data.csv'))
recipe_nutritional_data_csv = CSV.parse(recipe_nutritional_data_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_nutritional_data_csv.each do |row|
  r = RecipeNutritionalInfo.new
  r.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  r.value = row['value']
  r.nutrient = row['nutrient']
  r.save
end

# Recipe Methods

recipe_methods_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_methods.csv'))
recipe_methods_csv = CSV.parse(recipe_methods_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_methods_csv.each do |row|
  r = RecipeMethod.new
  r.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  r.title = row['title']
  r.description = row['description']
  r.video_url = row['video']
  r.save
  puts "Created RECIPE METHOD - #{r.title} for #{r.recipe.title}"
end


# Recipe Dietary Restrictions

recipe_dietary_restrictions_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipe_dietary_restrictions.csv'))
recipe_dietary_restrictions_csv = CSV.parse(recipe_dietary_restrictions_csv, :headers => true, :encoding => 'ISO-8859-1')

recipe_dietary_restrictions_csv.each do |row|
  recipe_diet = RecipeDietaryRestriction.new
  recipe_diet.dietary_restriction = DietaryRestriction.find_by(name: "#{row['restriction_name'].titlecase}")
  recipe_diet.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  recipe_diet.save
  puts "Created DIET - #{recipe_diet.dietary_restriction.name} for #{recipe_diet.recipe.title}"
end


# Lesson

lessons_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'lessons.csv'))
lessons_csv = CSV.parse(lessons_csv, :headers => true, :encoding => 'ISO-8859-1')

lessons_csv.each do |row|
  lesson = Lesson.new
  lesson.title = row['title'].titlecase
  lesson.book = Book.find_by(title: "#{row['book_name']}")
  lesson.recipe = Recipe.find_by(title: "#{row['recipe_name'].titlecase}")
  lesson.xp = 100
  lesson.save
  puts "Created LESSON - #{lesson.title}"
end


# Skill Chapters

skillchapters_csv = csv_text = File.read(Rails.root.join('lib', 'seeds', 'skillchapters.csv'))
skillchapters_csv = CSV.parse(skillchapters_csv, :headers => true, :encoding => 'ISO-8859-1')

skillchapters_csv.each do |row|
  skill = SkillChapter.new
  skill.title = row['title']
  skill.lesson = Lesson.find_by(title: "#{row['lesson_name'].titlecase}")
  skill.badge = Badge.find_by(name: "#{row['badge_name']}")
  skill.description = row['description']
  skill.save
  puts "Created SKILL CHAPTER - #{skill.title}"
end

# Extra Recipes

def create_recipe_connection(recipe_title, extra_recipes)
  new_extra_recipe = RecipeConnection.create(recipe: Recipe.find_by(title: recipe_title), extra_recipes_titles: extra_recipes)
  puts "Created extra recipes #{new_extra_recipe.extra_recipes_titles} for #{recipe_title}"
end

create_recipe_connection("Avotoast", ["Toast with smoked salmon", "Club Sandwich"])
create_recipe_connection("Spaghetti Carbonara", ["Mug Cake", "Peanut Butter and Jam Brownies"])
create_recipe_connection("Baked Portobello", ["Portobello with Blue Cheese", "Baked Potato"])
create_recipe_connection("Strawberry Fondue", ["Mushroom Pasta", "Pesto Pasta"])


# Admin Users + MVP Awards

helena = {
  admin: true,
  first_name: 'Helena',
  username: 'LovelyCarrot20',
  email: 'helenad.mim2021@london.edu',
  password: 'cuukin2020'
}

faris = {
  admin: true,
  first_name: 'Faris',
  username: 'HappySpinach33',
  email: 'fraucci.mba2022@london.edu',
  password: 'cuukin2020'
}

guilherme = {
  admin: true,
  first_name: 'Guilherme',
  username: 'CrazyBroccoli504',
  email: 'guilhermevmanhaes@gmail.com',
  password: 'cuukin2020'
}

wanmeng = {
  admin: true,
  first_name: 'Wanmeng',
  username: 'AmazingGarlic208',
  email: 'wzhang.mba2022@london.edu',
  password: 'cuukin2020'
}

elie = {
  admin: true,
  first_name: 'Elie',
  username: 'CoolPotato94',
  email: 'emhanna.mba2021@london.edu',
  password: 'cuukin2020'
}

ricardo = {
  admin: true,
  first_name: 'Ricardo',
  username: 'GloriousMushroom45',
  email: 'ricardob.mba2021@london.edu',
  password: 'cuukin2020'
}

julia = {
  admin: true,
  first_name: 'Julia',
  username: 'CheeryZucchini83',
  email: 'julia-frederico@outlook.com',
  password: 'cuukin2020'
}

admin_users = [helena, faris, guilherme, wanmeng, elie, ricardo, julia]

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

all_users = User.all

all_users.each do |user|
  UserAward.create(award: Award.find_by(name: 'Oh hi there!'), user: user)
end
