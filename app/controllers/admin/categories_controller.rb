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
      redirect_to  admin_categories_path
      flash[:success] = "Category create"
    else
      render_to new_admin_category_path
      flash[:danger] = "Not create"
    end
  end



  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
