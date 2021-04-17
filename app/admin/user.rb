ActiveAdmin.register User do
  menu parent: "User"

  permit_params :admin, :level, :cuukies, :xp

  index do
    selectable_column
    # column :id
    column :username
    column :first_name
    column :level
    column :cuukies
    column :xp
    column :sign_in_count
    column :created_at
    column :last_sign_in_at
    # column :admin
    actions
  end
end
