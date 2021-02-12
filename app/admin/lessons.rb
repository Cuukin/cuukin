ActiveAdmin.register Lesson do

  permit_params :name, :description, :xp, :photo, :book_id, :recipe_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :xp
      f.input :book_id
      f.input :recipe_id
      f.input :photo, as: :file
      f.button :submit
    end
  end

end
