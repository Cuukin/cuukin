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
end
