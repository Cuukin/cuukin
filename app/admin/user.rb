ActiveAdmin.register User do
  permit_params :admin, :level, :cuukies, :xp

  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :last_sign_in_at
    column :sign_in_count
    column :admin
    column :level
    column :cuukies
    column :xp
    actions
  end
end
