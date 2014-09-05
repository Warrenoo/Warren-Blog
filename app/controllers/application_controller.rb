class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin?

  def verify_login
    to_login unless session[:admin_mode]
  end

  def to_login
    session[:original_url] = request.path
    redirect_to admin_login_path
  end

  def is_admin?
    session[:admin_mode]
  end
end
