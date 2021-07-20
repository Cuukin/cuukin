# 1. Creating RECIPES from BBC Recipes CSV

require 'csv'

batch = {
  quiz_questions: true,
  quiz_answers: true,
  bbc_recipes: true
}

bbc_recipes_csv = File.read(Rails.root.join('lib', 'seeds', 'bbc_recipes.csv'))
bbc_recipes_csv = CSV.parse(bbc_recipes_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Seeding BBC Recipes... ✨"

if batch[:bbc_recipes]
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
end

# 2. Seeding Quizzes Batch #1

quiz_csv = File.read(Rails.root.join('lib', 'seeds', 'quiz_01.csv'))
quiz_csv = CSV.parse(quiz_csv, :headers => true, :encoding => 'ISO-8859-1')

puts "✨ Seeding Quizzes... ✨"

if batch[:quiz_questions]
  puts "Seeding Questions..."

  quiz_csv.each do |row|
    question_title = row['question_title']
    skill_chapter_title = row['skill_chapter_name']

    case skill_chapter_title
    when "Olive Oil"
      skill_chapter_title = "Olive oil"
    when "Dried Pasta"
      skill_chapter_title = "Dried pasta"
    end

    skill_chapter = SkillChapter.find_by(title: skill_chapter_title)
    quiz_question = QuizQuestion.find_by(question: question_title)

    if !quiz_question
      puts "This Question doesn't exist yet, let me create it..."
      new_quiz_question = QuizQuestion.new(question: question_title, skill_chapter: skill_chapter)
      puts "Created #{new_quiz_question.question}" if new_quiz_question.save
    else
      puts "This Question is already on the Database..."
    end
  end
end

if batch[:quiz_answers]
  puts "Seeding Answers..."

  quiz_csv.each do |row|
    question_title = row['question_title']
    quiz_question = QuizQuestion.find_by(question: question_title)

    answer_option = row[0]
    correct = row['correct'] == 'Yes' ? true : false

    existing_quiz_option = QuizQuestionOption.find_by(option: answer_option)

    if !quiz_question
      puts "Ops, couldn't find this Quiz Question - #{question_title}"
    else
      if existing_quiz_option && existing_quiz_option.quiz_question.question == quiz_question
        puts "Ops, this option already exists!"
      else
        new_quiz_option = QuizQuestionOption.new(quiz_question_id: quiz_question.id, option: answer_option, is_correct: correct)
        puts "Create #{new_quiz_option.option}" if new_quiz_option.save
      end
    end
  end
end
