module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, class: style) +
      (link_to "Register", new_user_registration_path, class: style)
    else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: style)
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AshwoodViewTool::Renderer.copyright 'Rosalynn Ashwood', 'All rights reserved'
  end

  def active? path
    "--active" if current_page? path
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      }
    ]
  end

  def nav_helper link_style, tag_type, tag_style
    nav_links = ""

    nav_items.each do |item|
      nav_links << "<#{tag_type} class='#{tag_style}'>
                    <a href='#{item[:url]}'class='#{link_style}
                                          #{link_style}#{active? item[:url]}'>
                    #{item[:title]}</a>
                    </#{tag_type}>"
    end

    nav_links.html_safe
  end
end
