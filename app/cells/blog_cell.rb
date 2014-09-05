# coding: utf-8
class BlogCell < Cell::Rails

  helper TruncateHtmlHelper
  helper ApplicationHelper
  def recommend
    @recommend_blogs = Blog.publish.order(created_at: :desc).limit(10)
    render
  end

  def lately
    @lately_blogs = Blog.publish.order(created_at: :desc).limit(10)
    render
  end

end
