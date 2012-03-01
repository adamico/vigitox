require 'stringex'
class ArticlesController < InheritedResources::Base
  autocomplete :author, :nom
  autocomplete :argument, :name, full: true
  respond_to :html, :json
  belongs_to :revue
  custom_actions collection: :search

  def search
    @search = params[:search].to_ascii if params[:search]
    @articles = Article.search(@search, params[:page]).includes(:revue).page(params[:page]).order("revue_id DESC")
  end

  def show
    @article = parent.articles.find_by_position(params[:id])
    @prev = resource_class.prev(@article).first
    @next = resource_class.next(@article).first
    show!
  end

  protected

  def collection
    @articles ||= end_of_association_chain.order(:position).page(params[:page])
  end
end
