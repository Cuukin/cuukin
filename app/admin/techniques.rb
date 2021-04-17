ActiveAdmin.register Technique do
  menu parent: "Lists"

  permit_params :name, :badge_id, :score_1, :score_2, :score_3

  index do
    selectable_column
    # column :id
    column :name
    column :badge
    actions
  end

end
