class ValidateBookCompletionJob < ApplicationJob
  queue_as :default

  def perform(user, lesson_validation)
    book = lesson_validation.lesson.book
    lesson_validations = user.lesson_validations.where(validated: true)
    lesson_validations = lesson_validations.select {|lv| lv.lesson.book_id == book.id}
    if lesson_validations.count == book.lessons.count
      user.xp += book.xp
      user.save
    end
  end
end
