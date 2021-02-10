class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def lesson
    @lesson_validation = LessonValidation.new
    authorize @lesson_validation, policy_class: LessonValidationPolicy
  end
end
