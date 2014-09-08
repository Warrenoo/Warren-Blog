# coding: utf-8
module TagsHelper
  include BlogsHelper

  def cache_key_for_tags(status)
    @tags_count = Tag.count
    @tags_max_updated_at = Tag.maximum("updated_at").try(:utc).try(:to_s, :number)
    "tag-#{status}-#{@tags_count}-#{@tags_max_updated_at}/#{cache_key_for_blogs(status)}"
  end

end
