class LessonValidation < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :recipe

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  # validates :difficulcy, :photo, presence: true
  validates :lesson, uniqueness: { scope: :user, message: 'This lesson has already been validated' }

  validates :recipe, presence: true

  private

  def check_recipe
    [self.lesson.recipes, self.lesson.recipe].flatten.include?(self.recipe)
  end
end
