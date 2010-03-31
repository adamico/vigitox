# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def prev_and_next_item(ptext, sep, ntext, pobject, nobject, tag_options = {}, html_options = nil)
    haml_concat(link_to ptext, pobject, tag_options, html_options) if pobject
    haml_concat(sep)
    haml_concat(link_to ntext, nobject, tag_options, html_options) if nobject
  end
end
