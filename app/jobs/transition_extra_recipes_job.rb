class TransitionExtraRecipesJob < ApplicationJob
  queue_as :default

  def perform(user, lesson_validation)
    validated_recipe = lesson_validation.recipe
    UserRecipe.create(user: user, recipe: validated_recipe, completed: true)

    lesson = lesson_validation.lesson
    extra_recipes = [lesson.recipes, lesson.recipe].flatten - [validated_recipe]
    extra_recipes.each do |extra_recipe|
      UserRecipe.create(user: user, recipe: extra_recipe, completed: false)
    end
  end
end
