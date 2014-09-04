# coding: utf-8
class Blog < ActiveRecord::Base

  has_many :tag_blogs
  has_many :tags, through: :tag_blogs

  before_save :save_markdown

  def id
    super || 1
  end

  def content
    super || "这篇文章什么内容都没有"
  end

  def title
    super || "这个文章没有标题"
  end

  private

  # 提交或修改内容时将内容转成markdown格式存储起来
  # 降低页面渲染压力
  def save_markdown
    self.markdown_content = MK.render self.content
  end

end
