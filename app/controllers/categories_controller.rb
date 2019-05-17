class CategoriesController < ApplicationController
  def index
    @categories= Category.joins(:words).group("categories.id")
  end
    
end
