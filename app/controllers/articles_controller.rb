class ArticlesController < ApplicationController
  before_filter :find_revue, :only => [:index, :create, :new]

  def sort
    params[:articles].each_with_index do |id, index|
      Article.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def index
    @articles = @revue.articles.order(:position).
      paginate(:page => params[:page], :per_page => 1)
  end

  def search
    @search = Article.search(params[:search])
    @articles = @search.order("revue_id DESC").includes(:revue).paginate(:page => params[:page])
  end

  def new
    @article = @revue.articles.build
  end

  def create
    @article = @revue.articles.build(params[:article])
    if @article.save
      redirect_to revue_articles_path(@revue, :page => @article.position),
        :notice => "Successfully created article."
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to revue_articles_path(@article.revue, :page => @article.position), :notice => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to revue_path(@article.revue_id), :notice => "Successfully destroyed article."
  end

  private

  def find_revue
    @revue = Revue.find(params[:revue_id])
  end
end
