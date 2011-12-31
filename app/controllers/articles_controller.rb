require 'stringex'
class ArticlesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :update
  respond_to :html, :json

  expose(:revue)
  expose(:articles) do
    revue.articles.paginate(:page => params[:page], :per_page => 1).order(:position)
  end
  expose(:article)

  def search
    @search = params[:search].to_ascii if params[:search]
    @articles = Article.search(@search, params[:page]).includes(:revue).page(params[:page]).order("revue_id DESC")
    respond_with @articles
  end

  def new
    article = revue.articles.build
  end

  def create
    article.revue_id = revue.id
    article.save
    respond_with(revue, article)
  end

  def update
    article.update_attributes(params[:article])
    respond_with(revue, article)
  end

  def destroy
    article.destroy
    respond_with(revue, article, :location => revue_path(revue))
  end
end
