ActiveAdmin.register Badge do

  permit_params :name, :description, :category, :icon, :bronze, :white

end
