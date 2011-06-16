# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def actions(model)
    haml_tag 'ul.actions' do
      haml_tag :li do
        haml_concat(link_to "Modifier", edit_polymorphic_path(model))
      end
      haml_tag :li do
        haml_concat(link_to "Détruire", model, :confirm => 'Etes-vous sur?', :method => :delete)
      end
    end
  end
  def prev_and_next_item(ptext="préc.", sep=" ", ntext="succ.", pobject=@prev, nobject=@next, tag_options = {}, html_options = nil)
    haml_concat(link_to ptext, pobject, tag_options, html_options) if pobject
    haml_concat(sep)
    haml_concat(link_to ntext, nobject, tag_options, html_options) if nobject
  end
  def link_to_with_title(name, url, title=name)
    link_to name, url, :title => title
  end
end
