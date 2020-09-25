require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module MarkdownHelper
  REDCARPET_OPTIONS = {
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true
  }.freeze

  class HTMLwithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown_to_html(md_text)
    html_render = HTMLwithRouge.new(filter_html: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(html_render, REDCARPET_OPTIONS)
    markdown.render(md_text).html_safe
  end
end
