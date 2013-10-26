module ApplicationHelper

  def full_title(page_title)
    base_title = "H Service Bohemia"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def nav_link(link_text, link_path)
    class_name = 'active' if current_page?(link_path)

    if current_page?(link_path)
      content_tag(:li, :class => class_name ) do
        link_text 
      end 
    else          
      content_tag(:li, :class => class_name) do
        link_to link_text, link_path
      end
    end
  end

  def nested_nav_link(link_text, link_path)
    class_name = 'nest-active' if current_page?(link_path)

    if current_page?(link_path) && current_page?(:controller => "categories")
      content_tag(:div, :class => class_name ) do
        link_text 
      end 
    else          
      content_tag(:div, :class => class_name) do
        link_to link_text, link_path
      end
    end
  end

  def set_human_locale(locale)
    case locale
    when :cs || "cs"
      "Czech"
    when :ru || "ru"
      "Russian"
    when :en || "en"
      "English"  
    end
  end
end