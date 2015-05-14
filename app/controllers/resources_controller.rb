# coding: utf-8
class ResourcesController < ApplicationController

  before_action :verify_login
  before_filter :set_resource, only: [:show, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create_images]

  def index
    @resources = Resource.order(id: :desc).paginate(page: params[:page])
    render layout: 'admin'
  end

  def new
    render layout: 'admin'
  end

  # AJAX保存图片方法
  # @POST
  def create_images
    resource = Resource.new(image: params[:file])
    if true || resource.save
      render status: 200, nothing: true
    else
      render status: 500, nothing: true
    end
  end

  def destroy
    if @resource.destroy
      flash[:notice] = "删除成功！"
    else
      flash[:alert] = "删除失败！"
    end
    redirect_to resources_path
  end

  private
  def set_resource
    @resource = Resource.find_by(id: params[:id])
    raise InstanceNoExist if @resource.blank?
  end
  
end
