# -*- coding: utf-8 -*-

class Admin::SessionController < ApplicationController
  skip_before_action :authenticate_account!

  # 登录页面
  def index
    render layout: 'admin'
  end

  # 验证登录
  def create

    username = params[:username]
    password = params[:password]

    if auth_login(username, password)
      set_session
      redirect_to(session[:original_url] || "/")
    else
      redirect_to("/admin/login", alert: "用户名或密码不正确")
    end
  end


  # 注销
  def destroy
    reset_session
    redirect_to("/")
  end


  private

  # 用户验证
  # @return
  def auth_login(username, password)
    admins = Rails.application.config.admin_settings["admin"]
    return admins.has_key?(username) && admins[username] == password
  end


  def set_session
    session[:admin_mode] = true
  end

end
