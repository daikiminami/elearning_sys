class CategoriesController < ApplicationController
  def index
    @page = params[:status]
    if params[:status] == nil
      @categories = Category.joins(:words).group("categories.id")
    elsif params[:status]=='learned'
      @categories = Category.joins(:lessons).group("categories.id").where(lessons: {user_id: current_user.id}).where.not(lessons: {result: "nil"})
    else params[:status]=='unlearned'
      @categories = Category.joins("LEFT OUTER JOIN lessons ON categories.id = lessons.category_id AND lessons.user_id = #{current_user.id}").where(lessons: {result: nil}).joins(:words).group(:id)
    end
  end
end
