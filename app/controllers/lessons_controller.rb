class LessonsController < ApplicationController
  def create
    category = Category.find(params[:category_id])
    lesson = Lesson.find_by(category: category, user: current_user)
    if lesson then lesson.destroy end
    lesson = category.lessons.build(user: current_user)
    lesson.save
    redirect_to new_lesson_answer_path(lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = Answer.where(lesson_id: params[:id])
  end
 
end
