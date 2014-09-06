# coding: utf-8
class TagsController < ApplicationController

  before_action :verify_login, only: [:new, :create, :destroy]
  before_filter :set_tag, only: [:show, :destroy]
  def new
    @tag = Tag.new
    render layout: 'admin'
  end

  def destroy
    if @tag.destroy
      redirect_to "/", notice: "删除成功"
    else
      redirect_to :back, alert: "删除失败"
    end
  end

  def create
    @tag = Tag.new(params.require(:tag).permit!)
    if @tag.save
      redirect_to "/", notice: "创建成功"
    else
      render "new", notice: "删除成功"
    end
  end

  private
  def set_tag
    @tag = Tag.find_by(id: params[:id])
  end
  
end
