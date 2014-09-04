class BlogCell < Cell::Rails

  def recommend
    @recommend_blogs = [Blog.new] * 10
    #@recommend_blogs = Blog.all
    render
  end

end
