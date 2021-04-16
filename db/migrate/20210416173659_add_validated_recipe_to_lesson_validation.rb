class AddValidatedRecipeToLessonValidation < ActiveRecord::Migration[6.0]
  def change
    add_reference :lesson_validations, :recipe, foreign_key: true, null: true
    add_column :lesson_validations, :like, :boolean, null: true
  end
end
