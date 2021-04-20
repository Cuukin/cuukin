class TransitionExtraRecipesJob < ApplicationJob
  queue_as :default

  def perform(user, lesson_validation)
    validated_recipe = lesson_validation.recipe
    notes = lesson_validation.notes
    like = lesson_validation.like
    difficulcy = lesson_validation.difficulcy

    user_recipe = UserRecipe.create(user: user, recipe: validated_recipe, completed: true,
            notes: notes, like: like, difficulcy: difficulcy)

    if lesson_validation.photo.attached?
      # photo_url = lesson_validation.photo.service_url
      photo_blob = lesson_validation.photo.blob
      user_recipe.photo.attach(photo_blob)
      user_recipe.save
    end

    lesson = lesson_validation.lesson
    extra_recipes = [lesson.recipes, lesson.recipe].flatten - [validated_recipe]
    extra_recipes.each do |extra_recipe|
      UserRecipe.create(user: user, recipe: extra_recipe, completed: false)
    end
  end
end
