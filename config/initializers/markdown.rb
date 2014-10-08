# coding: utf-8

class HTMLwithCodeRay < Redcarpet::Render::HTML
  def block_code(code, language)
    language ||= :plaintext
    #CodeRay.scan(code, language).div(:tab_width=>2)
    #formatter = Rouge::Formatters::HTML.new(line_numbers: true)
    #lexer = Rouge::Lexer.find(language)
    #formatter.format(lexer.lex(code))
    Rouge.highlight(code, language, 'html')
  end
end

class Markdown
  def render(text)
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay, autolink: true, no_intro_emphasis: true, fenced_code_blocks: true)
    markdown.render(text.to_s).html_safe
  end
end

ROUGE_THEME = Rouge::Theme.find('thankful_eyes').render(scope: '.highlight')
MK = Markdown.new

