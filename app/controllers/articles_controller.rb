class ArticlesController < ApplicationController
  def index
    @revue = Revue.find(params[:revue_id])
    @articles = @revue.articles
  end
  
  def new
    @revue = Revue.find(params[:revue_id])
    @article = @revue.articles.build
  end
  
  def create
    @revue = Revue.find(params[:revue_id])
    @article = @revue.articles.build(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to revue_url(@article.revue_id)
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
      redirect_to revue_url(@article.revue_id)
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
end
