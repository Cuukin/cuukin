class AddStatusToLessonValidation < ActiveRecord::Migration[6.0]
  def change
    remove_column :lesson_validations, :completed, :boolean
    add_column :lesson_validations, :status, :integer
  end
end
