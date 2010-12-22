module ArticlesHelper
  def links_to_associations(article, association, method = "name")
    unless article.send(association).empty?
      links = []
      article.send(association).each do |item|
        links << link_to(item.send(method), polymorphic_path(item))
      end
      haml_concat links.join(', ').html_safe
    end
  end
  def links_to_arguments(article)
    if article.arguments == "aucun argument"
      return article.arguments
    else
      links = []
      article.arguments.split(', ').each do |argument|
        links << link_to(argument, argument_path(Argument.find_by_name(argument)))
      end
      haml_concat links.join(' / ').html_safe
    end
  end
end
