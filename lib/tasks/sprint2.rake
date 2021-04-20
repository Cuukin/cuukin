namespace :sprint2 do
  desc "Update all Lesson Validation so they have Recipe ID == Lesson Main Recipe"
  task update_all_lesson_validation: :environment do
    LessonValidation.where(validated: true).each do |lv|
      lv.recipe = lv.lesson.recipe
      lv.save!
    end
  end

end
