class RecipesController < ApplicationController
  before_action :set_recipe, :set_validations

  def show
    validated?
    available?
    first?

    @grocery_list_item = GroceryListItem.new

    authorize @recipe, policy_class: RecipePolicy
  end

  private

  def validated?
    @validated = @validated_lessons.include?(@lesson)
    @user_recipe = @recipe.user_recipes.find_by(user: current_user)
  end

  def available?
    prev_lesson = @lesson.order_in_book - 1
    unless prev_lesson == 0
      @available = @validated_lessons.include?(Lesson.find_by(order_in_book: prev_lesson))
    end
  end

  def first?
    @first = @lesson.order_in_book == 1
  end

  def set_validations
    @validated_lessons = LessonValidation.includes(:lesson).where(user: current_user).map {|val| val.lesson}
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
    @lesson = @recipe.lesson
  end
end
