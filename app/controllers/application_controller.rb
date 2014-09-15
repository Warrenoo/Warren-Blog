class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :is_xhr?
  helper_method :is_admin?

  class BlogNoExist < StandardError; end
  rescue_from BlogNoExist, with: :render_blog_no_exist

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

  def is_xhr?
    request.format.xhr?
  end

  # 错误页面跳转
  def render_blog_no_exist
    render file: File.join(Rails.root, "public/blog_no_exist.html"), status: 500, layout: false
  end
end
