# coding: utf-8
module BlogsHelper

  def cache_key_for_blogs(status)
    count = Blog.count
    max_updated_at = Blog.maximum("updated_at").try(:utc).try(:to_s, :number)
    "blogs/#{status}-#{count}-#{max_updated_at}"
  end

  def cache_key_for_blog(blog)
    max_updated_at = blog.updated_at.try(:utc).try(:to_s, :number)
    "blog/show-#{blog.id}-#{max_updated_at}"
  end

end
