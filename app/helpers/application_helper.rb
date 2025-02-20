module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def text_active_class(link_path)
    current_page?(link_path) ? 'text-active' : ''
  end

  def page_title
    case controller_name
    when 'dashboard'
      'Dashboard'
    when 'users'
      'Users'
    when 'EntityInfo'
      'Clients'
    # Add more cases for other controllers
    else
      ''
    end
  end

  def self.handle_active_class(status)
    if status
      I18n.t(:active)
    else
      (status == false ? I18n.t(:inactive) : I18n.t(:pending))
    end
  end
end
