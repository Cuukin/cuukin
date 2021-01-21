ActiveAdmin.register Skill do

  permit_params :name, :photo

  form do |f|
    f.inputs do
      f.input :name
      f.input :photo, as: :file
      f.button :submit
    end
  end

end
