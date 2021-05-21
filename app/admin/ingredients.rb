ActiveAdmin.register Ingredient do
  menu parent: "Lists"

  permit_params :name, :badge_id, :score_1, :score_2, :score_3, :content, :photo, :cupboard

  index do
    selectable_column
    # column :id
    column :name
    column :badge
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :badge
      f.input :score_1
      f.input :score_2
      f.input :score_3
      f.input :cupboard
      f.input :photo, as: :file
      f.rich_text_area :content, as: :action_text
      f.button :submit
    end
  end

end
