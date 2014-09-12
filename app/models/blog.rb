# coding: utf-8
class Blog < ActiveRecord::Base

  has_many :tag_blogs
  has_many :tags, through: :tag_blogs

  before_save :save_markdown, :update_updated_at

  scope :desc, -> { order created_at: :desc }
  # 未删除
  scope :actived, -> { where active: true }
  # 已删除
  scope :deleted, -> { where active: false }
  # 已发布
  scope :publish, -> { where publish: true, active: true }
  # 未发布
  scope :unpublish, -> { where publish: false, active: true }

  STATUS = [["全部","all"],["未发布","unpublish"],["已发布","publish"],["已删除","deleted"]]

  def status
    if active
      publish ? "已发布" : "未发布"
    else
      "已删除"
    end
  end

  private

  # 提交或修改内容时将markdown内容转成html格式存储起来
  # 降低页面加载压力
  def save_markdown
    self.markdown_content = MK.render(self.content) if self.content_changed?
  end

  # 当只修改了关联表时修改blog的updated_at用来让缓存过期
  def update_updated_at
    self.updated_at = Time.now unless self.changed?
  end

  class << self
    def search(search_key)
      return Blog if search_key.blank?
      record = Blog
      record = record.send(search_key[:status]) if search_key[:status].present?
      record
    end
  end

end
