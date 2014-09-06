class TagCell < Cell::Rails

  cache :list
  def list
    @tags = Tag.hots
    render
  end

end
