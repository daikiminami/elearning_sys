module CategoriesHelper
  def checklearn(category)
    Lesson.find_by(params[category_id: category.id])
  end

  def user_result(category)
    Lesson.where(category_id: category.id).where.not(result: nil)
  end
  
  def lesson(category,user)
    user_result(category).find_by(params[category_id: category.id,user_id: user.id])
  end

end
