namespace :sprint2 do
  desc "Update all Lesson Validation so they have Recipe ID == Lesson Main Recipe"
  task update_all_lesson_validation: :environment do
    LessonValidation.where(validated: true).each do |lv|
      lv.recipe = lv.lesson.recipe
      lv.save!
    end
  end

  task update_all_user_recipe: :environment do
    UserRecipe.where(completed: true).each do |ur|
      lv = LessonValidation.find_by(user: ur.user, recipe: ur.recipe)
      ur.notes = lv.notes
      ur.like = lv.like
      ur.difficulcy = lv.difficulcy
      ur.photo.attach(lv.photo.blob) if lv.photo.attached?
      ur.save!
    end
  end

  task update_all_user_skill: :environment do
    LessonValidation.where(validated: true).each do |lv|
      user = lv.user
      lesson = lv.lesson
      lesson.skill_chapters.each do |skill|
        UserSkill.create(user: user, skill_chapter: skill)
      end
    end
  end

  task update_all_pasta_fundamentals_user_recipe: :environment do
    carbonara_recipe = Recipe.find_by(title: 'Spaghetti Carbonara')
    UserRecipe.where(recipe: carbonara_recipe, completed: true).each do |ur|
      user = ur.user
      user_recipes = user.user_recipes
      pesto_pasta_recipe = Recipe.find_by(title: 'Pesto Pasta')
      mushroom_pasta_recipe = Recipe.find_by(title: 'Creamy Mushroom Pasta')
      unless user_recipes.include?(pesto_pasta_recipe)
        UserRecipe.create(user: user, recipe: pesto_pasta_recipe, completed: false)
      end
      unless user_recipes.include?(mushroom_pasta_recipe)
        UserRecipe.create(user: user, recipe: mushroom_pasta_recipe, completed: false)
      end
    end
  end
end
