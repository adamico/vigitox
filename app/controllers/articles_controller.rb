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
    search!
  end

  protected

  def collection
    @articles ||= end_of_association_chain.order(:position).page(params[:page])
  end
end
