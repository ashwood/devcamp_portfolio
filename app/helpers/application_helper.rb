module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path) +
      (link_to "Register", new_user_registration_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AshwoodViewTool::Renderer.copyright 'Rosalynn Ashwood',
                                        'All rights reserved'
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
