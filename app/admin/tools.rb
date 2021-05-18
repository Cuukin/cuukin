ActiveAdmin.register Tool do
  menu parent: "Lists"

  permit_params :name, :suggested_product, :badge_id, :score_1, :score_2, :score_3

  index do
    selectable_column
    # column :id
    column :name
    column :badge
    # column :suggested_product
    actions
  end

end
