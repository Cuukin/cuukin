class AddPhotoPresentFieldToLessonValidations < ActiveRecord::Migration[6.0]
  def change
    add_column :lesson_validations, :photo_present, :boolean, null: false, default: false
    add_column :user_recipes, :photo_present, :boolean, null: false, default: false
  end
end
