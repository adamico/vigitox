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
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
