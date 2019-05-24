class WordsController < ApplicationController
  def index
    @categories = current_user.categories.left_outer_joins(:lessons).merge(Lesson.where.not(result: nil))
    if params[:id]
      category = Category.find(params[:id])
      @answers = category.answers.where(lessons: {user_id: current_user.id})
      @category_name = Category.find(params[:id]).title
    else
      @answers = current_user.answers
      @category_name = "All"
    end
  end
end
