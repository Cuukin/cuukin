ActiveAdmin.register UserBadge do
  menu parent: "User"

  permit_params :user_id, :badge_id, :xp

  index do
    selectable_column
    # column :id
    column :user
    column :badge
    column :xp
    actions
  end

end
