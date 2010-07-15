class ArticlesController < ApplicationController
  before_filter :find_revue, :only => [:index, :create, :new]

  def sort
    params[:articles].each_with_index do |id, index|
      Article.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  def index
    @articles = @revue.articles.paginate :page => params[:page], :order => :position
  end

  def new
    @article = @revue.articles.build
  end

  def create
    @article = @revue.articles.build(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to revue_articles_path(@revue, :page => @article.position)
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
      flash[:notice] = "Successfully updated article."
      redirect_to revue_articles_path(@article.revue, :page => @article.position)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to revue_url(@article.revue_id)
  end
  private
  def find_revue
    @revue = Revue.find(params[:revue_id])
  end
end
