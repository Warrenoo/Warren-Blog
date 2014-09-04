# coding: utf-8
class Blog < ActiveRecord::Base

  def content
    super || "这篇文章什么内容都没有"
  end

  def title
    super || "这个文章没有标题"
  end
  
end
