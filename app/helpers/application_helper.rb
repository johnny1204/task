module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(email: session[:user_id])
  end
end
