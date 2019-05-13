class Admin::CategoriesController < ApplicationController
  def index
    @categories=Category.all
  end

  def new
    @category=Category.new
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    @category.update(
      title: params[:category][:title],
      description: params[:category][:description]
    )
    flash[:success] = "Category updated"
    redirect_to  admin_categories_path
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      flash[:success] = "Category create"
      redirect_to  admin_categories_path
    else
      flash[:danger] = "Not create"
      render  'new'
    end
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_path
  end
  
  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
