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
  xp: 100
}

book_2 = {
  title: 'Kitchen Basics',
  description: "So just for the cooking beginner, some basic information I hope will help as you bravely go forth into the wonderful world of recipes.",
  level: 'chef_in_progress',
  xp: 100
}

books = [book_1, book_2]

books.each do |book|
  new_book = Book.create(book)
  puts "Created #{new_book.title} 📗"
end

recipe_1 = {
  title: 'Avotoast',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
}

recipe_2 = {
  title: 'Spaghetti al Carbonara',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
}

recipe_3 = {
  title: 'Baked Portobello',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
}

recipe_4 = {
  title: 'Strawberry Fondue',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
}

recipes = [recipe_1, recipe_2, recipe_3, recipe_4]

recipes.each do |recipe|
  new_recipe = Recipe.create(recipe)
  puts "Created #{new_recipe.title} 🍌"
end

lesson_1 = {
  title: 'Avotoast',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 1,
  book_id: 1,
  xp: 50
}

lesson_2 = {
  title: 'Spaghetti al Carbonara',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 2,
  book_id: 1,
  xp: 50
}

lesson_3 = {
  title: 'Baked Portobello',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 3,
  book_id: 1,
  xp: 50
}

lesson_4 = {
  title: 'Strawberry Fondue',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 4,
  book_id: 1,
  xp: 50
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
  puts "Created #{new_recipe_method.title}"
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
  puts "Created #{new_skill_chapter.title}"
end

RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, measure: 2, unit: 'tbsp')
RecipeIngredient.create(recipe_id: 1, ingredient_id: 2, measure: 4, unit: 'lts')
RecipeIngredient.create(recipe_id: 1, ingredient_id: 4, measure: 1)

RecipeTool.create(recipe_id: 1, tool_id: 1)
RecipeTool.create(recipe_id: 1, tool_id: 2)
RecipeTool.create(recipe_id: 1, tool_id: 3)

RecipeTechnique.create(recipe_id: 1, technique_id: 1)
RecipeTechnique.create(recipe_id: 1, technique_id: 2)
RecipeTechnique.create(recipe_id: 1, technique_id: 3)
