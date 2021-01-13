ActiveAdmin.register User do
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
    actions
  end
end
