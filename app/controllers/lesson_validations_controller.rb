class LessonValidationsController < ApplicationController
  before_action :set_lesson, only: [ :create, :update ]

  def create
    @lesson_validation = LessonValidation.new(lesson_validation_params)
    @lesson_validation.validated = true
    set_user(@lesson_validation, @lesson, current_user)

    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.save
      redirect_to book_path(@lesson.book), notice: "Lesson validated"
    else
      redirect_to lesson_path(@lesson), alert: "Couldn't validate your Lesson"
    end

    transition_currency(@lesson, current_user)
    transition_recipe(@lesson.recipe, current_user)
    transition_extra_recipes(@lesson.recipe, current_user)
  end

  def update
    @lesson_validation = LessonValidation.find_by(lesson_id: @lesson.id, user: current_user)
    authorize @lesson_validation, policy_class: LessonValidationPolicy

    if @lesson_validation.update(lesson_validation_params)
      @lesson_validation.validated = true
      @lesson_validation.save
      redirect_to book_path(@lesson.book)
    else
      render :new
    end

    transition_recipe(@lesson.recipe, current_user)
    transition_extra_recipes(@lesson.recipe, current_user)
    transition_currency(@lesson, current_user)
  end

  private

  def transition_extra_recipes(recipe, user)
    extra_recipes = recipe.recipe_connections.first.extra_recipes_titles
    extra_recipes.each do |extra_recipe|
      UserRecipe.create(user: user, recipe: Recipe.find_by(title: extra_recipe), completed: false)
    end
  end

  def transition_recipe(recipe, user)
    UserRecipe.create(user: user, recipe: recipe, completed: true)
  end

  def transition_currency(lesson, user)
    user.xp += lesson.xp
    user.save
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_user(lesson_validation, lesson, user)
    lesson_validation.lesson = lesson
    lesson_validation.user = user
  end

  def lesson_validation_params
    params.require(:lesson_validation).permit(:difficulcy, :notes, :photo)
  end
end
