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


# Skills

# skills = %w(Chopping Seasoning Oven CookPasta CookVegetables CookChicken CookRice PanFry Platting FreshPasta)

# skills.each do |skill|
#   new_skill = Skill.create(name: skill)
#   puts "Created #{new_skill.name} skill"
# end

# Tools

pots_and_pans = ['Frying Pan', 'Sautese', 'Pot', 'Sauce Pan', 'Pressure Pot']
mechanicals = ['Food Processor', 'Suvid', 'Blender', 'Thermometer', 'Scale', 'Rolling Pin']
heating = ['Microwave', 'Stove', 'Oven', 'Airfryer']
containers = ['Baking Tray', 'Bowl', 'Colander', 'Ovenproof Container']
cutting = ['Knife', 'Peeler', 'Grader']
utensils = ['Spatula', 'Whisk', 'Cutting Board', 'Spoon', 'Fork']
disposables = ['Cling Film', 'Paper Towels', 'Parchment Paper', 'Aluminum Foil']
refrigerators = ['Fridge', 'Freezer']

def create_tool(tools_array, category)
  tools_array.each do |tool|
    new_tool = Tool.new(name: tool)
    new_tool.category = category
    new_tool.save
    puts "Created #{new_tool.name} under category #{new_tool.category}"
  end
end

create_tool(pots_and_pans, 'pots and pans')
create_tool(mechanicals, 'mechanicals')
create_tool(heating, 'heating')
create_tool(containers, 'containers')
create_tool(cutting, 'cutting')
create_tool(utensils, 'utensils')
create_tool(disposables, 'disposables')
create_tool(refrigerators, 'refrigerators')

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
    new_ingredient.category = category
    new_ingredient.save
    puts "Created #{new_ingredient.name} under category #{new_ingredient.category}"
  end
end

create_ingredient(fruits, 'fruits')
create_ingredient(fake_veggies, 'fake veggies')
create_ingredient(seeds_grains, 'seeds and grains')
create_ingredient(stem_greens, 'stem greens')
create_ingredient(leafy_greens, 'leafy greens')
create_ingredient(bulbs, 'bulbs')
create_ingredient(roots, 'roots')
create_ingredient(herbs, 'herbs')
create_ingredient(bread, 'bread')
create_ingredient(pasta, 'pasta')
create_ingredient(sweets, 'sweets')
create_ingredient(fats_oil, 'fats and oils')
create_ingredient(chicken, 'chicken')
create_ingredient(pork, 'pork')
create_ingredient(beef, 'beef')
create_ingredient(fish, 'fish')
create_ingredient(eggs, 'eggs')
create_ingredient(funghi, 'funghi')
create_ingredient(seafood, 'seafood')
create_ingredient(dairy, 'dairy')
create_ingredient(seasonings, 'seasonings')
create_ingredient(sauces, 'sauces')

# Books, Lessons and Recipes

book_1 = {
  name: 'Kitchen SOS'
  description: "So just for the cooking beginner, some basic information I hope will help as you bravely go forth into the wonderful world of recipes.",
  level: 'newbie',
  xp: 100
}

book_2 = {
  name: 'Kitchen Basics'
  description: "So just for the cooking beginner, some basic information I hope will help as you bravely go forth into the wonderful world of recipes.",
  level: 'chef_in_progress',
  xp: 100
}

books = [book_1, book_2]

books.each do |book|
  new_book = Book.create(book)
  puts "Created #{new_book.name} 📗"
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
  name: 'Avotoast',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 1,
  book_id: 1,
  xp: 50
}

lesson_2 = {
  name: 'Spaghetti al Carbonara',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 2,
  book_id: 1,
  xp: 50
}

lesson_3 = {
  name: 'Baked Portobello',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 3,
  book_id: 1,
  xp: 50
}

lesson_4 = {
  name: 'Strawberry Fondue',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  recipe_id: 4,
  book_id: 1,
  xp: 50
}

lessons = [lesson_1, lesson_2, lesson_3, lesson_4]

lessons.each do |lesson|
  new_lesson = Lesson.create(lesson)
  puts "Created #{new_lesson.name} 🌯"
end

recipe_method_1 = {
  recipe_id: 1,
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  video_url: 'https://res.cloudinary.com/cuukin/video/upload/v1613661861/Cuukin-prot2_juwuht.mp4'
}
