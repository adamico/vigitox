# encoding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def actions(model)
    haml_tag 'div.btn-group.pull-right' do
      haml_concat(link_to "Modifier", edit_polymorphic_path(model), class: "btn btn-warning")
      haml_concat(link_to "Détruire", model, data: {confirm: 'Etes-vous sûr?'}, method: :delete, class: "btn btn-danger")
    end
  end
  def prev_and_next_item(ptext="préc.", ntext="succ.", ppath=@prev, npath=@next, pobject=@prev, nobject=@next)
    haml_tag 'ul.pager' do
      haml_tag 'li.previous' do
        haml_concat(link_to_with_title ptext.html_safe, ppath, "Numéro précédent") if pobject
      end
      haml_tag 'li.next' do
        haml_concat(link_to_with_title ntext.html_safe, npath, "Numéro suivant") if nobject
      end
    end
  end
  def link_to_with_title(name, url, title=name)
    link_to name, url, title: title
  end
end
