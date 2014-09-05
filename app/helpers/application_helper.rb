module ApplicationHelper
  def date_format(time)
    return time unless time.respond_to? :strftime
    time.strftime('%Y/%m/%d')
  end

  def datetime_format(time)
    return time unless time.respond_to? :strftime
    time.strftime('%Y/%m/%d %H:%M')
  end

  def html_split(content)
    truncate_html(content, break_token: "<!-- more -->", length: 800, omission: '</br>...')
  end

  def tags
    @tags ||= Tag.desc.pluck(:name, :id)
  end
end
