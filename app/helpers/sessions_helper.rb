module SessionsHelper
  def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
  # check if there is current user (return true or false)
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end
end
