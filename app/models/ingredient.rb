class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredient_lists
  has_many :recipes, through: :recipe_ingredient_lists

  validates :name, uniqueness: true, presence: true
end
