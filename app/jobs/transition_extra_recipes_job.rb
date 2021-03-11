class TransitionExtraRecipesJob < ApplicationJob
  queue_as :default

  def perform(user, recipe)
    UserRecipe.create(user: user, recipe: recipe, completed: true)
    extra_recipes = recipe.recipe_connection.extra_recipes_titles
    extra_recipes.each do |extra_recipe|
      UserRecipe.create(user: user, recipe: Recipe.find_by(title: extra_recipe), completed: false)
    end
  end
end
