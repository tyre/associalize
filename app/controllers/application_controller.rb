class ApplicationController < ActionController::Base
  protect_from_forgery

  def go_to_user_page
    redirect_to user_path(current_user) if current_user
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
