class LessonRecipe < ApplicationRecord
  belongs_to :lesson
  belongs_to :recipe

  validates :lesson, uniqueness: { scope: :recipe, message: 'This Recipe is already connected to that Lesson' }
end
