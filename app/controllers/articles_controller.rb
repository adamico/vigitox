require 'stringex'
class ArticlesController < InheritedResources::Base
  respond_to :html, :json
  autocomplete :author, :nom
  autocomplete :argument, :name, full: true
  belongs_to :revue
  custom_actions collection: :search

  def search
    @search = params[:search].to_ascii if params[:search]
    @articles = Article.search(@search, params[:page]).includes(:revue).
      order("revue_id DESC").page(params[:page])
  end

  def show
    @article_by_position = parent.articles.find_by_position(resource.position)
    @prev = resource_class.prev(@article_by_position).first
    @next = resource_class.next(@article_by_position).first
    show!
  end
end
