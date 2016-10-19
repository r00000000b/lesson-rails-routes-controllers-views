# Building A Rails App with Relationships

## Introduction

> ***Note:*** _This can be a pair programming activity or done independently._  Instructors may want to do a short introduction to strong params, the rails console, and migrations in Rails.

For this lab, we are going to build a Cookbook app with several models that interact one another.

## Exercise

#### Requirements

- Create a rails app
- Create a model `Recipe` that has these attributes:
	- Name (string)
	- Instructions (text)
	- Servings (integer)
- Create a model `Course` with one attribute: `name` as a string
- Link `Recipe` and `Course` so that a course has many recipes and a recipe belongs to a course
- Test if associations works in the Rails console (`rails c`)

**Bonus:**
- Create a model `Ingredient` and a has_many and belongs_to relations between recipes and ingredients (Hints: You need a Join table)

**OPTIONAL** for tomorrow
- Be sure to create the RESTful controller actions and the corresponding routes
- then set up the appropriate views

#### Deliverable

You should be able to go to `rails c` and create new course, recipes (and ingredients for bonus) and be able to call these

- Course.first.recipes
- Recipe.first.course
- Recipe.first.ingredients (bonus)
- Ingredients.first.recipe (bonus)
- Ingredients.first.recipe.course (bonus)

## Additional Resources

- [ActiveRecord docs](http://guides.rubyonrails.org/association_basics.html)
