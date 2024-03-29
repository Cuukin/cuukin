class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :recipe_ingredients, through: :recipe
  has_many :ingredient, through: :recipe_ingredients

  has_one_attached :photo

  enum difficulcy: { easy: 0, medium: 1, hard: 2 }

  validates :recipe, uniqueness: { scope: :user, message: 'This user already has this recipe' }

  before_save :define_photo_present

  include PgSearch::Model
  pg_search_scope :global_search,
    associated_against: {
      recipe: :title,
      ingredient: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  private

  def define_photo_present
    self.photo_present = true if self.photo.attached?
  end
end
