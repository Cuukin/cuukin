ActiveAdmin.register Recipe do

  permit_params :title, :description, :prep_time, :photo_url

end
