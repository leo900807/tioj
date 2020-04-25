require 'redcarpet'
module ApplicationHelper
  def markdown(text)
    if text == nil
      return
    end
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, escape_html: false)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def markdown_no_p(text)
    ret = markdown(text)
    ActiveSupport::SafeBuffer.new(Regexp.new('^<p>(.*)<\/p>$').match(ret)[1]) rescue ret
  end

  def markdown_no_html(text)
    if text == nil
      return
    end
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, escape_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def destroy_glyph
    return raw '<span class="glyphicon glyphicon-trash"></span>'
  end

  def edit_glyph
    return raw '<span class="fui-new"></span>'
  end

  def pin_glyph
    return raw '<span class="glyphicon glyphicon-pushpin"></span>'
  end

  def rejudge_glyph
    return raw '<span class="glyphicon glyphicon-repeat"></span>'
  end
end
