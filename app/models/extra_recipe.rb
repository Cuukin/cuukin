class ExtraRecipe < ApplicationRecord
  belongs_to :recipe

  validates :title, :photo_url, :external_url, presence: true
end
