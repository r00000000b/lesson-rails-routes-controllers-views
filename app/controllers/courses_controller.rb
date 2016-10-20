class CoursesController < ApplicationController
  def index #if you have nothing. rails will still render the name of the method
    @courses = Course.all
  end
end
