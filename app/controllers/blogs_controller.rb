# coding: utf-8
class BlogsController < ApplicationController

  before_action :verify_login, only: [:new, :edit, :create, :destroy, :update, :update_publish, :admin_index]
  before_filter :set_blog, only: [:show, :edit, :update, :destroy, :update_publish]

  def index
  end

  def new
    @blog = Blog.new
    render layout: 'admin'
  end

  def edit
    render layout: 'admin'
  end

  def show
  end

  def destroy
    if @blog.update(active: false, publish: false)    # 删除同时修改发布状态为false
      redirect_to admin_index_blogs_path, notice: "删除成功"
    else
      redirect_to :back, alert: "删除失败"
    end
  end

  # 发布状态转换
  # POST
  def update_publish
    if @blog.update(publish: !@blog.publish)
      redirect_to :back, notice: "修改成功"
    else
      redirect_to :back, notice: "修改失败"
    end
  end

  def create
    blog = Blog.new(params.require(:blog).permit!)
    if blog.save
      redirect_to blog, notice: "创建成功"
    else
      render 'new', alert: "创建失败"
    end
  end

  def update
    if @blog.update(params.require(:blog).permit!)
      redirect_to @blog, notice: "修改成功"
    else
      render 'edit', alert: "修改失败"
    end
  end

  def admin_index
    @params = params[:search_key] || {}
    @blogs = Blog.search(params[:search_key]).includes(:tags).order(id: :desc).page(params[:page])
    render layout: 'admin'
  end

  private
  def set_blog
    record = is_admin? ? Blog : Blog.publish
    @blog = record.find_by(id: params[:id])
    raise BlogNoExist if @blog.blank?
  end
end
