# coding: utf-8

class HomeController < ApplicationController

  before_action :verify_login, only: :clear_cache
  
  def index
  end

  def about
  end

  # 手动清理缓存，用于特殊情况
  # delete请求
  def clear_cache
    Rails.cache.clear
    redirect_to :back
  end

  # 查询-使用google进行定址查询
  def search
    redirect_to "https://www.google.com.hk/#hl=zh-CN&q=site:blog.janecy.com+#{params[:key]}"
  end
end
