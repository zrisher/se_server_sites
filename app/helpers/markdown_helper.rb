module MarkdownHelper
   RENDERER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  def render_markdown(markdown_string)
    RENDERER.render(markdown_string).html_safe
  end

end
