module BlogsHelper

  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 30
  end

  def truncate_helper text, path, style = ''
    truncate(text, length: 675) { link_to "(continued)", path, class: "#{style}" }
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      auto_links: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def blog_status_toggle(blog)
    blog.draft? ? 'toggle-off' : 'toggle-on'
  end
end
