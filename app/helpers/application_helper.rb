module ApplicationHelper

  def link_to_icon(label, path, i_class, button_class="btn btn-success", method="")
    link_to((content_tag(:i, "", class: i_class) + content_tag(:span, label)), path, class: button_class, method: method)
  end
end
