# Admin Users
# Remember everyone to update their password

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

# Badges
# Ingredient Badges

ingredient_badges = ['Root Vegetables', 'Bulbs', 'Greens', 'not Veggies', 'Fruits', 'Seeds and Grains',
                    'Legumes', 'Funghi', 'Chicken', 'Beef', 'Pork', 'Fish', 'Seafood', 'Eggs', 'Dairy',
                    'Fats and Oils', 'Condiments', 'Herbs and Spices', 'Cooking Alcohols', 'Stocks and Sauces',
                    'Sweeteners and Chocolate', 'Bread, Flour and Pasta']

ingredient_badges.each do |i_badge|
  new_badge = Badge.new(name: i_badge)
  new_badge.category = 'ingredient'
  new_badge.save
end

# Tool Badges

tool_badges = ['Cutting', 'Utensils', 'Pots and Pans', 'Containers', 'Disposables',
              'Heating', 'Storage', 'Appliances']

tool_badges.each do |t_badge|
  new_badge = Badge.new(name: t_badge)
  new_badge.category = 'tool'
  new_badge.save
end

# Technique Badges

technique_badges = ['Chopping', 'Seasoning', 'Preserving', 'Mixing', 'Prepping',
                    'Oven Cooking', 'Stove-top Cooking', 'Alternative Cooking']

technique_badges.each do |tec_badge|
  new_badge = Badge.new(name: tec_badge)
  new_badge.category = 'technique'
  new_badge.save
end

# Tools

pots_and_pans = ['Frying Pan', 'Sautese', 'Pot', 'Sauce Pan', 'Pressure Pot']
mechanicals = ['Food Processor', 'Suvid', 'Blender', 'Thermometer', 'Scale', 'Rolling Pin']
heating = ['Microwave', 'Stove', 'Oven', 'Airfryer']
containers = ['Baking Tray', 'Bowl', 'Colander', 'Ovenproof Container']
cutting = ['Knife', 'Peeler', 'Grader']
utensils = ['Spatula', 'Whisk', 'Cutting Board', 'Spoon', 'Fork']
disposables = ['Cling Film', 'Paper Towels', 'Parchment Paper', 'Aluminum Foil']

def create_tool(tools_array, category)
  tools_array.each do |tool|
    new_tool = Tool.new(name: tool)
    new_tool.badge = Badge.find_by(name: category)
    new_tool.save
    puts "Created #{new_tool.name} under Badge #{new_tool.badge.name}"
  end
end

create_tool(pots_and_pans, 'Pots and Pans')
create_tool(mechanicals, 'Utensils')
create_tool(heating, 'Heating')
create_tool(containers, 'Containers')
create_tool(cutting, 'Cutting')
create_tool(utensils, 'Utensils')
create_tool(disposables, 'Disposables')

# Ingredients

fruits = ['Apple', 'Banana', 'Pear', 'Strawberry', 'Lemon', 'Avocado']
fake_veggies = ['Pepper', 'Cuccumber', 'Tomato', 'Butternut Squash', 'Eggplant', 'Cherry Tomato', 'Red Pepper', 'Aubergine']
seeds_grains = ['White Rice', 'Cashew Nuts', 'Black Beans', 'Chickpea', 'Wholemeal Flour', 'Wheat Flour', 'Corn Flour', 'Breading Flour', 'Pine Nuts', 'Flour', 'Seasame Seeds', 'Risoto Rice', 'Pistacchio', 'Red Lentils']
stem_greens = ['Broccoli', 'Aspargus', 'Celery']
leafy_greens = ['Lettuce', 'Kale', 'Spinach', 'Watercress', 'Salad', 'Cabbage']
bulbs = ['Onion', 'Garlic', 'Green Onion', 'Red Onion', 'Ginger']
roots = ['Potato', 'Sweet Potato', 'Carrot', 'Radish']
herbs = ['Fresh Oregano', 'Basil', 'Parsley', 'Coriander', 'Thyme', 'Sage', 'Fresh Mint', 'Dried Oregano', 'Dried Mint']
bread = ['Sliced Bread', 'Focaccia', 'Baguette', 'Yeast', 'Fresh Bread', 'Puff Pastry', 'English Muffin', 'Pitta Bread', 'Burger Bun']
pasta = ['Dried Spaghetti', 'Lasagne Sheet']
sweets = ['Sugar', 'Chocolate', 'Dark Chocolate', 'Nutella', 'Honey', 'Light Brown Sugar', 'Chocolate Chips']
fats_oil = ['Butter', 'Olive Oil', 'Coconout Oil', 'Cooking Oil']
chicken = ['Chicken Legs', 'Chicken Breast']
pork = ['Bacon', 'Pork Ribs', 'Pepperoni', 'Prosciutto', 'Ham', 'Minced Pork', 'Sausage']
beef = ['Ground Beef', 'Sirloin Steak', 'Filet Mignon', 'Burger']
fish = ['Salmon', 'Cod', 'Tuna Steak', 'Fresh Fish']
eggs = ['Egg']
funghi = ['Shimeji Mushrooms', 'Portobello Mushrooms', 'Shitake Mushrooms', 'White Mushrooms', 'Chestnut Mushrooms', 'Dried Porccini Mushrooms']
seafood = ['Oysters', 'Prawns']
dairy = ['Milk', 'Mozzarella Cheese', 'Heavy Cream', 'Parmesan Cheese', 'Soured Cream', 'Goat Cheese', 'Cheese', 'Alternative Milk', 'Coconut Cream', 'Feta Cheese', 'Mature Cheddar', 'Pecorino Cheese']
seasonings = ['Salt', 'Sea Salt', 'Black Pepper', 'Paprika', 'Apple Vinegar', 'White Vinegar', 'Dijon Mustard', 'Ketchup', 'Brandy', 'White Wine', 'Dill', 'Vanilla Extract', 'Flaky Salt', 'Cocoa Powder', 'Balsamic Vinegar', 'Oyster Sauce', 'Soy Sauce', 'Olives']
sauces = ['Tomato Sauce', 'Bechamel Sauce', 'Tartar Sauce', 'Vegetable Stock', 'Mayonnaise', 'Chicken Stock', 'Beef Stock', 'Fish Stock', 'Curry Sauce', 'Worcestershire Sauce']

def create_ingredient(ingredients_array, category)
  ingredients_array.each do |ingredient|
    new_ingredient = Ingredient.new(name: ingredient)
    new_ingredient.badge = Badge.find_by(name: category)
    new_ingredient.save
    puts "Created #{new_ingredient.name} under Badge #{new_ingredient.badge.name}"
  end
end

create_ingredient(fruits, 'Fruits')
create_ingredient(fake_veggies, 'not Veggies')
create_ingredient(seeds_grains, 'Seeds and Grains')
create_ingredient(stem_greens, 'Greens')
create_ingredient(leafy_greens, 'Greens')
create_ingredient(bulbs, 'Bulbs')
create_ingredient(roots, 'Root Vegetables')
create_ingredient(herbs, 'Herbs and Spices')
create_ingredient(bread, 'Bread, Flour and Pasta')
create_ingredient(pasta, 'Bread, Flour and Pasta')
create_ingredient(sweets, 'Sweeteners and Chocolate')
create_ingredient(fats_oil, 'Fats and Oils')
create_ingredient(chicken, 'Chicken')
create_ingredient(pork, 'Pork')
create_ingredient(beef, 'Beef')
create_ingredient(fish, 'Fish')
create_ingredient(eggs, 'Eggs')
create_ingredient(funghi, 'Funghi')
create_ingredient(seafood, 'Seafood')
create_ingredient(dairy, 'Dairy')
create_ingredient(seasonings, 'Herbs and Spices')
create_ingredient(sauces, 'Stocks and Sauces')

# Books, Lessons and Recipes

book_1 = {
  title: 'Kitchen SOS',
  description: "So just for the cooking beginner, some basic information I hope will help as you bravely go forth into the wonderful world of recipes.",
  level: 'newbie',
  xp: 200
}

book_2 = {
  title: 'Kitchen Basics',
  description: "So just for the cooking beginner, some basic information I hope will help as you bravely go forth into the wonderful world of recipes.",
  level: 'newbie',
  xp: 200
}

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
  title: 'Spaghetti al Carbonara',
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
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_method_2 = {
  recipe_id: 1,
  title: 'Chopping Onions',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

recipe_methods = [recipe_method_1, recipe_method_2]

recipe_methods.each do |recipe_method|
  new_recipe_method = RecipeMethod.create(recipe_method)
  puts "Created #{recipe_method[:title]}"
end

skill_chapter_1 = {
  lesson_id: 1,
  badge_id: 1,
  title: 'Onions 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_2 = {
  lesson_id: 1,
  badge_id: 2,
  title: 'Oil 101',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapter_3 = {
  lesson_id: 1,
  badge_id: 3,
  title: 'Carrots',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}

skill_chapters = [skill_chapter_1, skill_chapter_2, skill_chapter_3]

skill_chapters.each do |skill_chapter|
  new_skill_chapter = SkillChapter.create(skill_chapter)
  puts "Created #{skill_chapter[:title]}"
end

RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, quantity: 2, unit: 'tbsp')
RecipeIngredient.create(recipe_id: 1, ingredient_id: 2, quantity: 4, unit: 'lts')
RecipeIngredient.create(recipe_id: 1, ingredient_id: 4, quantity: 1)

RecipeTool.create(recipe_id: 1, tool_id: 1)
RecipeTool.create(recipe_id: 1, tool_id: 2)
RecipeTool.create(recipe_id: 1, tool_id: 3)

RecipeTechnique.create(recipe_id: 1, technique_id: 1)
RecipeTechnique.create(recipe_id: 1, technique_id: 2)
RecipeTechnique.create(recipe_id: 1, technique_id: 3)

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

# Dietary Restrictions Listing

soy = {
  name: "Soy",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/soy_eh96vh.svg"
}

gluten = {
  name: "Gluten",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/gluten_cwkiry.svg"
}

sugar = {
  name: "Low sugar",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/lowsugar_moqpep.svg"
}

shell = {
  name: "Shellfish",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/shellfish_msezlr.svg"
}

nuts = {
  name: "Nuts",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/nuts_a5kkpn.svg"
}

veggie = {
  name: "Vegetarian",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/veggie_tbvw1y.svg"
}

vegan = {
  name: "Vegan",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163944/Cuukin%20-%20Dietary%20Restrictions/vegan_mohegz.svg"
}

halal = {
  name: "Halal",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/halal_rsv5ep.svg"
}

dairy = {
  name: "Dairy",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/dairy_mtcdrd.svg"
}

gluten = {
  name: "Gluten",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/gluten_cwkiry.svg"
}

kosher = {
  name: "Kosher",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/kosher_bwm5re.svg"
}

fat = {
  name: "Low fat",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/lowfat_xuve1a.svg"
}

egg = {
  name: "Eggs",
  icon: "https://res.cloudinary.com/cuukin/image/upload/v1615163942/Cuukin%20-%20Dietary%20Restrictions/egg_qqrhsl.svg"
}

dietary_restrictions = [soy, gluten, sugar, shell, nuts, veggie, vegan, halal, dairy, gluten, kosher, fat, egg]

dietary_restrictions.each do |dietary_restriction|
  new_dietary_restriction = DietaryRestriction.create(dietary_restriction)
  puts "Created #{dietary_restriction[:name]}"
end


