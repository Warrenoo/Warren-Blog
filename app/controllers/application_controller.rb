class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :is_xhr?
  helper_method :is_admin?

  class InstanceNoExist < StandardError; end
  rescue_from InstanceNoExist, with: :render_instance_no_exist

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
  def render_instance_no_exist
    @error_name = controller_name.classify.constantize.model_name.human
    render file: File.join(Rails.root, "public/instance_no_exist.html"), status: 500, layout: false
  end
end
