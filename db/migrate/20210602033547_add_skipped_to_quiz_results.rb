class AddSkippedToQuizResults < ActiveRecord::Migration[6.0]
  def change
    add_column :quiz_results, :skipped, :boolean, null: false, default: false
  end
end
