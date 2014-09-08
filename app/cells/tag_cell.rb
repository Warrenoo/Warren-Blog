class TagCell < Cell::Rails

  cache :list, :expires_in => 2.hours
  def list
    @tags = Tag.hots
    render
  end

end
