module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, class: style) +
      (link_to "Register", new_user_registration_path, class: style)
    else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: style)
    end
  end

  def source_helper link_style, tag_style
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, if you'd like to work together, feel free to #{ link_to 'contact me', contact_path, class: link_style }.".html_safe
      content_tag(:div, greeting, class: tag_style )
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



  def alerts
    alert = (flash[:alert]) || (flash[:error]) || (flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Devcamp Portfolio", sticky: false)
  end
end
