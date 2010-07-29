#encoding: utf-8
module ArticlesHelper
  def links_to_associations(article, association)
    unless article.send(association).empty?
      haml_tag :p do
        title = association.classify.constantize.human_name.pluralize
        haml_tag :strong do
          haml_concat "#{title} : "
        end
        links = []
        article.send(association).each do |item|
          links << link_to(h(item.name), polymorphic_path(item))
        end
        haml_concat links.join(', ').html_safe
      end
    end
  end
end
