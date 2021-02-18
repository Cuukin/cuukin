class RecipeTechnique < ApplicationRecord
  belongs_to :recipe
  belongs_to :technique
end
