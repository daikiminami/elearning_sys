module CategoriesHelper
  # def checklearn(category)
  #   Lesson.find(params[category_id: category.id])
  # end

  # def user_result(category)
  #   Lesson.where(category_id: category.id).where.not(result: nil)
  # end
  
  def lesson(category,user)
    Lesson.find_by(category_id: category.id,user_id: user.id)
  end

  def current_page(param)
    if param.eql?(@page) then return "active" end
  end
end
