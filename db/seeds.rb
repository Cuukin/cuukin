require 'csv'

# ingredients

ingredients_csv = File.read(Rails.root.join('lib', 'seeds', 'ingredients_v1.csv'))
ingredients_csv = CSV.parse(ingredients_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Solving Ingredients... ✨"

ingredients_csv.each do |row|
  ing = Ingredient.find_by(name: row['name'])
  bdg = Badge.find_by(name: row['badge_name'])
  if ing && bdg
    ing.badge = bdg
    ing.save
    puts "Saved ingredient #{ing.name} under badge #{ing.badge.name}"
  end
end

# tools

tools_csv = File.read(Rails.root.join('lib', 'seeds', 'tools_v1.csv'))
tools_csv = CSV.parse(tools_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Solving Tools... ✨"

tools_csv.each do |row|
  tool = Tool.find_by(name: row['name'])
  bdg = Badge.find_by(name: row['badge_name'])
  if tool && bdg
    tool.badge = bdg
    tool.save
    puts "Saved tool #{tool.name} under badge #{tool.badge.name}"
  end
end

# techniques

techniques_csv = File.read(Rails.root.join('lib', 'seeds', 'techniques_v1.csv'))
techniques_csv = CSV.parse(techniques_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Solving Techniques... ✨"

techniques_csv.each do |row|
  tech = Technique.find_by(name: row['name'])
  bdg = Badge.find_by(name: row['badge_name'])
  if tech && bdg
    tech.badge = bdg
    tech.save
    puts "Saved technique #{tech.name} under badge #{tech.badge.name}"
  end
end

# recipe methods

recipe_methods_csv = File.read(Rails.root.join('lib', 'seeds', 'recipe_methods_v1.csv'))
recipe_methods_csv = CSV.parse(recipe_methods_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Creating Recipe Methods... ✨"

RecipeMethod.all.each {|recipe_method| recipe_method.destroy}
puts "All Recipe Methods destroyed..."

recipe_methods_csv.each do |row|
  recipe = Recipe.find_by(title: row['Recipe'])
  if recipe
    recipe_method = RecipeMethod.new
    recipe_method.recipe = recipe
    recipe_method.title = row['Title']
    recipe_method.description = row['Description']
    recipe_method.video_url = row['VideoUrl']
    recipe_method.method_index = row['MethodIndex']
    recipe_method.save
    puts "Created method #{recipe_method.title} for recipe #{recipe.title}"
  end
end

# skill chapters

skill_chapters_csv = File.read(Rails.root.join('lib', 'seeds', 'skill_chapters_v1.csv'))
skill_chapters_csv = CSV.parse(skill_chapters_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Creating Skill Chapters... ✨"

SkillChapter.all.each {|skill_chapter| skill_chapter.destroy}
puts "All Skill Chapters destroyed..."

skill_chapters_csv.each do |row|
  lesson = Lesson.find_by(title: row['Lesson'])
  badge = Badge.find_by(name: row['Badge'])
  if lesson
    skill = SkillChapter.new
    skill.lesson = lesson
    skill.badge = badge
    skill.title = row['Title']
    skill.video_url = row['VideoUrl']
    skill.save
    puts "Created skill chapters #{skill.title} for lesson #{lesson.title}"
  end
end
