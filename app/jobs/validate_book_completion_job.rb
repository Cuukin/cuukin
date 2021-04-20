class ValidateBookCompletionJob < ApplicationJob
  queue_as :default

  def perform(user, lesson_validation)
    book = lesson_validation.lesson.book
    lesson_validations = user.lesson_validations.where(validated: true)
    lesson_validations = lesson_validations.select {|lv| lv.lesson.book_id == book.id}

    if lesson_validations.count == book.lessons.count
      if lesson_validation.photo.attached?
        user.xp += lesson_validation.lesson.xp
        user.xp += book.xp
      else
        user.xp += lesson_validation.lesson.xp / 2
        user.xp += book.xp
      end
    else
      if lesson_validation.photo.attached?
        user.xp += lesson_validation.lesson.xp
      else
        user.xp += lesson_validation.lesson.xp / 2
      end
    end

    user.save
  end
end
