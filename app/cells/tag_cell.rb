class TagCell < Cell::Rails

  def list
    @tags = Tag.hots
    render
  end

end
