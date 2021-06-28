ActiveAdmin.register User do
  menu parent: "User"

  permit_params :first_name, :last_name, :username, :photo, :level, :cuukies, :xp, :admin

  controller do
    def find_resource
      if resource_class.is_a?(FriendlyId)
        scoped_collection.friendly.find(params[:id])
      else
        scoped_collection.find(params[:id])
      end
    end
  end

  index do
    selectable_column
    column :id
    column :email
    column :username
    column :full_name
    column :level
    column :cuukies
    column :xp
    column :sign_in_count
    column :created_at
    column :last_sign_in_at
    # column :admin
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :photo, as: :file
      f.input :level
      f.input :cuukies
      f.input :xp
      f.input :admin
      f.button :submit
    end
  end
end
