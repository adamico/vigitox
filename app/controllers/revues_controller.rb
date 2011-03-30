class RevuesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :sort_articles
  respond_to :html, :js
  expose(:revue) { params[:id] ? Revue.includes(:articles).find(params[:revue_id]||params[:id]) : Revue.new(params[:revue])}
  expose(:revues) { Revue.recent.includes(:articles).all.paginate(:page => params[:page], :per_page => 3) }

  def sort_articles
    articles = revue.articles
    articles.each do |article|
      article.position = params[:article].index(article.id.to_s) + 1
      article.save
    end
    render :nothing => true
  end

  def archive
    revues = Revue.order("numero DESC")
    @revue_annees = revues.group_by(&:annee_sortie)
    respond_with(@revue_annees)
  end

  def show
    @prev = Revue.prev(revue).first
    @next = Revue.next(revue).first
    @article = Article.new(:revue => revue)
    respond_with(revue)
  end

  def create
    revue.save
    respond_with(revue)
  end

  def update
    revue.update_attributes(params[:revue])
    respond_with(revue)
  end

  def destroy
    revue.destroy
    respond_with(revue)
  end
end
