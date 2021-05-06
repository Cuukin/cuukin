ActiveAdmin.register UserRecipe do
  menu parent: "User"

  permit_params :user_id, :recipe_id, :difficulcy, :notes, :like, :photo, :completed, :public

  form do |f|
    f.inputs do
      f.input :user
      f.input :recipe
      f.input :difficulcy
      f.input :notes
      f.input :photo, as: :file
      f.input :like
      f.input :completed
      f.input :public
      f.button :submit
    end
  end

  index do
    selectable_column
    # column :id
    column :user
    column :recipe
    column :completed
    column :difficulcy
    column :notes
    # column :photo, as: :file
    actions
  end

end
