module ApplicationHelper

  def link_to_icon(label, path, i_class, button_class="btn btn-success", method="")
    link_to((content_tag(:i, "", class: i_class) + label), path, class: button_class, method: method, 'data-no-turbolink' => true)
  end
  def render_flash(content)
    sanitize content,
      tags: %w(strong i b),
      attributes: %w(class)
  end  
end
