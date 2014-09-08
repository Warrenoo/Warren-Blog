# coding: utf-8
class Blog < ActiveRecord::Base

  has_many :tag_blogs
  has_many :tags, through: :tag_blogs

  before_save :save_markdown

  scope :desc, -> { order created_at: :desc }
  # 未删除
  scope :actived, -> { where active: true }
  # 已发布
  scope :publish, -> { where publish: true, active: true }
  # 未发布
  scope :unpublish, -> { where publish: false, active: true }

  #accepts_nested_attributes_for :tag_blogs
  #def active; !super.zero?; end
  #def publish; !super.zero?; end

  private

  # 提交或修改内容时将内容转成markdown格式存储起来
  # 降低页面渲染压力
  def save_markdown
    self.markdown_content = MK.render(self.content) if self.content_changed?
  end

end
