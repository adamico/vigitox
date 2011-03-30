require 'stringex'
class ArticlesController < ApplicationController
  respond_to :html, :json

  expose(:revue)
  expose(:articles) do
    revue.articles.order(:position).
      paginate(:page => params[:page], :per_page => 1)
  end
  expose(:article)

  skip_before_filter :authenticate_user!, :only => :update

  def search
    @search = params[:search].to_ascii if params[:search]
    @articles = Article.search(@search, params[:page]).order("revue_id DESC").includes(:revue).paginate(:page => params[:page])
    respond_with @articles
  end

  def new
    article = revue.articles.build
  end

  def create
    article.revue_id = revue.id
    article.save
    respond_with(revue, article, :location => revue_path(revue))
  end

  def update
    article.update_attributes(params[:article])
    respond_with(revue, article, :location => revue_path(revue))
  end

  def destroy
    article.destroy
    respond_with(revue, article, :location => revue_path(revue))
  end
end
