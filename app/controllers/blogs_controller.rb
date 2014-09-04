# coding: utf-8
class BlogsController < ApplicationController

  before_filter :set_blog, only: [:show]

  def new
    @blog = Blog.new
  end

  def show
  end

  private
  def set_blog
    @blog = Blog.find_by(id: params[:id])
  end
end
