namespace :sprint2 do
  desc "TODO"
  task update_all_lesson_validation: :environment do
    LessonValidation.where(validated: true).each do |lv|
      lv.recipe = lv.lesson.recipe
    end
  end

end
