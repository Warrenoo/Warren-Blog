class BlogCell < Cell::Rails

  helper TruncateHtmlHelper
  def recommend
    @recommend_blogs = [Blog.first, Blog.new] * 10
    #@recommend_blogs = Blog.all
    render
  end

end
