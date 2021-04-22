class RecipesController < ApplicationController
  before_action :set_recipe, :set_validations

  def show
    validated?
    available?
    first?
  end

  private

  def validated?
    @validated = @validated_recipes.include?(@recipe)
  end

  def available?
    prev_lesson_id = @recipe.lessons.first.id - 1
    unless prev_lesson_id = 0
      @available = @validated_lessons.include?(Lesson.find(prev_lesson_id))
    end
  end

  def first?
    @first = @recipe.lessons.first.id == 1
  end

  def set_validations
    @validated_recipes = UserRecipe.includes(:recipe).where(user: current_user).map {|val| val.recipe}
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user).map {|val| val.lesson}
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
