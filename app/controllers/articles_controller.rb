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
    @article = parent.articles.find_by_position(params[:id])
    @prev = resource_class.prev(@article).first
    @next = resource_class.next(@article).first
    show!
  end
end
