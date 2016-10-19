10.times do
  Ingredient.create(name: Faker::Food.ingredient)
  Ingredient.create(name: Faker::Food.spice)
end

# while Ingredient.count < 20
#   Ingredient.create(name: Faker::Food.ingredient)
# end

["Appatizer", "Main", "Sides", "Deserts"].each do |course|
  c_params = {
    name: course
  }

  c = Course.create(c_params)

  10.times do
    r_params = {
      name: Faker::Commerce.product_name,
      instructions: Faker::Lorem.sentence,
      servings: rand(1..5)
    }

    r = c.recipes.create(r_params)

    ingredient_ids = Ingredient.pluck(:id)
    rand(3..8).times do
      r.recipe_ingredient_lists.create(ingredient_id: ingredient_ids.sample)
    end
  end
end