# coding: utf-8

class HomeController < ApplicationController

  before_action :verify_login, only: :clear_cache
  
  def index
  end

  # 手动清理缓存，用于特殊情况
  # delete请求
  def clear_cache
    Rails.cache.clear
    redirect_to :back
  end
end
