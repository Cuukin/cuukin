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

# Admin Users

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

# Books, Lessons and Recipes

book_1 = {
  title: 'Kitchen SOS',
  description: "New to cooking? Don't worry, we got your back. These basic recipes are a perfect starting point.",
  level: 'newbie',
  xp: 500
}

book_2 = {
  title: 'Kitchen Basics',
  description: "Coming up soon, please check our first book in the meantime.",
  level: 'newbie',
  xp: 500
}

# Description for Book 2 once its ready
# "You have the essentials down, lets move onto some new recipes. Don't worry, we're taking it easy on you still!"

books = [book_1, book_2]

books.each do |book|
  new_book = Book.create(book)
  puts "Created #{book[:title]} 📗"
end

recipe_1 = {
  title: 'Avotoast',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  photo_url: "https://images.unsplash.com/photo-1588137378633-dea1336ce1e2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  prep_time: "30 min"
}

recipe_2 = {
  title: 'Spaghetti Carbonara',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  photo_url: "https://images.unsplash.com/photo-1574926053821-79c5e338a933?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  prep_time: "20 min"
}

recipe_3 = {
  title: 'Baked Portobello',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  photo_url: "https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1285&q=80",
  prep_time: "40 min"
}

recipe_4 = {
  title: 'Strawberry Fondue',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  photo_url: "https://images.unsplash.com/photo-1588575866383-e2a07af0e7d6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  prep_time: "30 min"
}

recipes = [recipe_1, recipe_2, recipe_3, recipe_4]

recipes.each do |recipe|
  new_recipe = Recipe.create(recipe)
  puts "Created #{recipe[:title]} 🍌"
end

lesson_1 = {
  title: 'Avotoast',
  recipe_id: 1,
  book_id: 1,
  xp: 100
}

lesson_2 = {
  title: 'Spaghetti al Carbonara',
  recipe_id: 2,
  book_id: 1,
  xp: 100
}

lesson_3 = {
  title: 'Baked Portobello',
  recipe_id: 3,
  book_id: 1,
  xp: 100
}

lesson_4 = {
  title: 'Strawberry Fondue',
  recipe_id: 4,
  book_id: 1,
  xp: 100
}

lessons = [lesson_1, lesson_2, lesson_3, lesson_4]

lessons.each do |lesson|
  new_lesson = Lesson.create(lesson)
  puts "Created #{new_lesson.title} 🌯"
end

recipe_method_1 = {
  recipe_id: 1,
  title: 'Heating Oil',
  description: "Boil the water and dump the egg in there when you're ready.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_2 = {
  recipe_id: 1,
  title: 'Chopping Onions',
  description: "Serve on your preferable plate the pasta with bits of guaciale. You can add a little black pepper on top and some grated cheese as final touches. Serve immediately.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_3 = {
  recipe_id: 2,
  title: 'Heating Oil',
  description: "Boil the water and dump the egg in there when you're ready.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_4 = {
  recipe_id: 2,
  title: 'Chopping Onions',
  description: "Serve on your preferable plate the pasta with bits of guaciale. You can add a little black pepper on top and some grated cheese as final touches. Serve immediately.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_5 = {
  recipe_id: 3,
  title: 'Heating Oil',
  description: "Boil the water and dump the egg in there when you're ready.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_6 = {
  recipe_id: 3,
  title: 'Chopping Onions',
  description: "Serve on your preferable plate the pasta with bits of guaciale. You can add a little black pepper on top and some grated cheese as final touches. Serve immediately.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_7 = {
  recipe_id: 4,
  title: 'Heating Oil',
  description: "Boil the water and dump the egg in there when you're ready.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_8 = {
  recipe_id: 4,
  title: 'Chopping Onions',
  description: "Serve on your preferable plate the pasta with bits of guaciale. You can add a little black pepper on top and some grated cheese as final touches. Serve immediately.",
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_methods = [recipe_method_1, recipe_method_2, recipe_method_3, recipe_method_4, recipe_method_5, recipe_method_6, recipe_method_7, recipe_method_8]

recipe_methods.each do |recipe_method|
  new_recipe_method = RecipeMethod.create(recipe_method)
  puts "Created #{recipe_method[:title]}"
end

skill_chapter_1 = {
  lesson_id: 1,
  title: 'Onions 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_2 = {
  lesson_id: 1,
  title: 'Oil 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_3 = {
  lesson_id: 1,
  title: 'Carrots',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_4 = {
  lesson_id: 2,
  title: 'Onions 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_5 = {
  lesson_id: 2,
  title: 'Oil 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_6 = {
  lesson_id: 2,
  title: 'Carrots',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_7 = {
  lesson_id: 3,
  title: 'Onions 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_8 = {
  lesson_id: 3,
  title: 'Oil 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_9 = {
  lesson_id: 3,
  title: 'Carrots',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_10 = {
  lesson_id: 4,
  title: 'Onions 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_11 = {
  lesson_id: 4,
  title: 'Oil 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_12 = {
  lesson_id: 4,
  title: 'Carrots',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapters = [skill_chapter_1, skill_chapter_2, skill_chapter_3, skill_chapter_4, skill_chapter_5, skill_chapter_6, skill_chapter_7, skill_chapter_8, skill_chapter_9, skill_chapter_10, skill_chapter_11, skill_chapter_12]

skill_chapters.each do |skill_chapter|
  new_skill_chapter = SkillChapter.new(skill_chapter)
  new_skill_chapter.badge_id = rand(1..40)
  new_skill_chapter.save
  puts "Created #{skill_chapter[:title]}"
end

# Extra Recipes

avotoast_1 = {
  title: "Avocado Bruschetta",
  external_url: "https://www.bbc.co.uk/food/recipes/mozzarella_tomato_82203",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/mozzarella_tomato_82203_16x9.jpg"
}

avotoast_2 = {
  title: "Vegetarian Tacos",
  external_url: "https://www.bbc.co.uk/food/recipes/easy_vegetarian_tacos_88736",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/easy_vegetarian_tacos_88736_16x9.jpg"
}

carbonara_1 = {
  title: "Creamy Mushroom Pasta",
  external_url: "https://www.bbc.co.uk/food/recipes/creamy_mushroom_pasta_41818",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/creamy_mushroom_pasta_41818_16x9.jpg"
}

carbonara_2 = {
  title: "Chilli Bacon Spaghetti",
  external_url: "https://www.bbc.co.uk/food/recipes/creamy_chilli_bacon_and_60433",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/creamy_chilli_bacon_and_60433_16x9.jpg"
}

portobello_1 = {
  title: "Stuffed Portobello",
  external_url: "https://www.bbc.co.uk/food/recipes/stuffedportabellamus_85840",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/stuffedportabellamus_85840_16x9.jpg"
}

portobello_2 = {
  title: "Baked Chicken Breast",
  external_url: "https://www.bbc.co.uk/food/recipes/baked_chicken_breast_49731",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/baked_chicken_breast_49731_16x9.jpg"
}

fondue_1 = {
  title: "Chocolate Fudge",
  external_url: "https://www.bbc.co.uk/food/recipes/chocolate_fudge_cake_03213",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/chocolate_fudge_cake_03213_16x9.jpg"
}

fondue_2 = {
  title: "Cherry Mug Cake",
  external_url: "https://www.bbc.co.uk/food/recipes/cherryandchocolateca_84273",
  photo_url: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/cherryandchocolateca_84273_16x9.jpg"
}

extra_recipes = [avotoast_1, avotoast_2, carbonara_1, carbonara_2, portobello_1, portobello_2, fondue_1, fondue_2]

extra_recipes.each do |recipe|
  new_recipe = Recipe.create(recipe)
  puts "Created recipe #{recipe[:title]}"
end

def create_recipe_connection(recipe_title, extra_recipes)
  new_extra_recipe = RecipeConnection.create(recipe: Recipe.find_by(title: recipe_title), extra_recipes_titles: extra_recipes)
  puts "Created extra recipes #{new_extra_recipe.extra_recipes_titles} for #{recipe_title}"
end

create_recipe_connection("Avotoast", [avotoast_1[:title], avotoast_2[:title]])
create_recipe_connection("Spaghetti al Carbonara", [carbonara_1[:title], carbonara_2[:title]])
create_recipe_connection("Baked Portobello", [portobello_1[:title], portobello_2[:title]])
create_recipe_connection("Strawberry Fondue", [fondue_1[:title], fondue_2[:title]])

# Awards

award_1 = {
  name: "Sizzlin' Hot",
  description: "You cooked our recipes 3+ days in a row this week!
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

all_awards = Award.all
all_users = User.all

all_awards.each do |award|
  all_users.each do |user|
    UserAward.create(award_id: award.id, user_id: user.id)
  end
end

# Random Ingredients, Tools and Techniques per Recipe :)

def create_recipe_ingredients(recipe)
  5.times do
    r = RecipeIngredient.new
    r.recipe_id = recipe
    r.ingredient_id = rand(1..40)
    r.quantity = rand(1..4)
    r.unit = ['tbsp', 'cup', 'tsp', 'g'].sample
    r.save
  end
end

create_recipe_ingredients(1)
create_recipe_ingredients(2)
create_recipe_ingredients(3)
create_recipe_ingredients(4)

def create_recipe_tools(recipe)
  5.times do
    t = RecipeTool.new
    t.recipe_id = recipe
    t.tool_id = rand(1..30)
    t.save
  end
end

create_recipe_tools(1)
create_recipe_tools(2)
create_recipe_tools(3)
create_recipe_tools(4)

def create_recipe_techniques(recipe)
  5.times do
    t = RecipeTechnique.new
    t.recipe_id = recipe
    t.technique_id = rand(1..60)
    t.save
  end
end

create_recipe_techniques(1)
create_recipe_techniques(2)
create_recipe_techniques(3)
create_recipe_techniques(4)
