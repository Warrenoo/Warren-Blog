class TagCell < Cell::Rails
  include TagsHelper
  # 输出缓存通知
  include Cell::Caching::Notifications

  cache :list do |opts|
    cache_key_for_tags("list")
  end

  def list
    @tags = Tag.hots
    render
  end

end
