module ArticlesHelper
  def links_to_associations(dci, association)
    unless dci.send(association).empty?
      haml_tag :h2 do
        title = case association
          when "specialites"; "Spécialités : "
          when "classe_therapeutiques"; "Classes thérapeutiques : "
        end
        haml_concat title
        links = []
        dci.send(association).each do |item|
          links << link_to(h(item.name.humanize), polymorphic_path(item))
        end
        haml_concat links.join(', ')
      end
    end
    haml_tag 'div.clear' do end;
  end
end
