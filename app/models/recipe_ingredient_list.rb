class RecipeIngredientList < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :ingredient_id, uniqueness: { scope: :recipe_id,
    message: "should cotain one per recipe" }
end
