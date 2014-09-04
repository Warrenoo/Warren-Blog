# coding: utf-8

class HTMLwithCodeRay < Redcarpet::Render::HTML
  def block_code(code, language)
    language ||= :plaintext
    CodeRay.scan(code, language).div(:tab_width=>2)
  end
end

class Markdown
  def render(text)
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay, autolink: true, no_intro_emphasis: true, fenced_code_blocks: true)
    markdown.render(text.to_s).html_safe
  end
end

MK = Markdown.new

