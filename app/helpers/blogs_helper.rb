module BlogsHelper

  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 30
  end

  def truncate_helper text, path, style = ''
    truncate(text, length: 275) { link_to "(continued)", path, class: "#{style}" }
  end
end
