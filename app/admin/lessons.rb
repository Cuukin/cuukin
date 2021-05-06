ActiveAdmin.register Lesson do
  menu parent: "Lesson"

  permit_params :title, :xp, :book_id, :order_in_book

  index do
    selectable_column
    # column :id
    column :title
    column :book
    column :order_in_book
    column :xp
    actions
  end

  # form do |f|
  #   f.inputs do
  #     f.input :name
  #     f.input :description
  #     f.input :xp
  #     f.input :book_id
  #     f.input :recipe_id
  #     f.input :photo, as: :file
  #     f.button :submit
  #   end
  # end

end
