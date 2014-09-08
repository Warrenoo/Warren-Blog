# coding: utf-8
module BlogsHelper

  def cache_key_for_blogs(status)
    @blogs_count ||= Blog.count
    @blogs_max_updated_at ||= Blog.maximum("updated_at").try(:utc).try(:to_s, :number)
    "blog-#{status}-#{@blogs_count}-#{@blogs_max_updated_at}"
  end

  def cache_key_for_blog(blog)
    @blog_max_updated_at ||= blog.updated_at.try(:utc).try(:to_s, :number)
    "blog-show-#{blog.id}-#{@blog_max_updated_at}"
  end

end
