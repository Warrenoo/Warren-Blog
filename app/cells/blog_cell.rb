# coding: utf-8
class BlogCell < Cell::Rails

  helper TruncateHtmlHelper
  helper ApplicationHelper
  helper BlogsHelper

  include BlogsHelper
  # 输出缓存通知
  include Cell::Caching::Notifications

  # 缓存
  %w(recommend lately index).each do |key|
    cache key.to_sym do |opts|
      cache_key_for_blogs(key)
    end
  end

  def recommend
    @recommend_blogs = Blog.publish.order(created_at: :desc).limit(10)
    render
  end

  def lately
    @lately_blogs = Blog.publish.order(created_at: :desc).limit(10)
    render
  end

  def index
    @blogs = Blog.publish.desc.group_by{|b| b.created_at.strftime("%Y-%m") }
    render
  end

end
