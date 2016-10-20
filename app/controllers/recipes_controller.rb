class RecipesController < ApplicationController
  before_action :set_errors
  before_action :set_parent_path
  before_action :set_courses_category, only: [:new, :edit]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :get_recipes, only: [:index]

  def index #if you have nothing. rails will still render the name of the method
    # puts request.referer
    render 'recipes/index'
  end

  def show
    render 'recipes/show'
  end

  def new
    @recipe = flash[:recipe].nil? ? Recipe.new :  Recipe.new(flash[:recipe])
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      flash[:recipe] = @recipe
      flash[:errors] = @recipe.errors.messages
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = flash[:recipe].nil? ? @recipe : Recipe.new(flash[:recipe])
  end

  def update
    @recipe.assign_attributes(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      flash[:recipe] = @recipe
      flash[:errors] = @recipe.errors.messages
      redirect_to edit_recipe_path
    end
  end

  def delete
    # Recipe.find(params[:id]).delete
    # flash[:success] = "User Deleted"
    # redirect_to recipes_path
  end

  def destroy
   if @recipe.destroy
     redirect_to @recipe
   else
     @message = "Cannot delete recipe"
   end
  end

private
  def get_recipes
    @recipes = Recipe.all
    @message = "No Recipes Found" if @recipes.empty?
  end

  def set_recipe
    @recipe  = Recipe.find_by(id: params[:id])
    @message = "Cannot Find Recipe With ID #{params[:id]}"
  end

  def set_errors
    @errors  = flash[:errors]
  end

  def set_courses_category
    @courses = Course.order(:name).pluck(:name, :id)
  end

  def set_parent_path
    @parent_resource = "/"
    @parent_path     = ""
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :servings, :course_id)
  end
end
