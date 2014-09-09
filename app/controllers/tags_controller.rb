# coding: utf-8
class TagsController < ApplicationController

  before_action :verify_login, only: [:new, :create, :destroy, :edit, :update, :admin_index]
  before_filter :set_tag, only: [:show, :destroy, :edit, :update]
  def new
    @tag = Tag.new
    render layout: 'admin'
  end

  def destroy
    if @tag.destroy
      redirect_to admin_index_tags_path, notice: "删除成功"
    else
      redirect_to :back, alert: "删除失败"
    end
  end

  def create
    @tag = Tag.new(params.require(:tag).permit!)
    if @tag.save
      redirect_to admin_index_tags_path, notice: "创建成功"
    else
      render "new", notice: "创建失败"
    end
  end

  def edit
    render layout: 'admin'
  end

  def update
    if @tag.update(params.require(:tag).permit!)
      redirect_to admin_index_tags_path, notice: "修改成功"
    else
      render "new", notice: "修改失败"
    end
  end

  def show
    @blogs = @tag.blogs.desc.group_by{|b| b.created_at.strftime("%Y-%m") }
  end

  def admin_index
    @tags = Tag.desc.page(params[:page])
    render layout: 'admin'
  end

  private
  def set_tag
    @tag = Tag.find_by(id: params[:id])
  end
  
end
