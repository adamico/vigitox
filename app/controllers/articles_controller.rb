# encoding: UTF-8
require 'stringex'
class ArticlesController < ApplicationController
  respond_to :html, :json
  before_filter :set_article, only: [:show, :edit, :update, :destroy]
  autocomplete :author, :nom
  autocomplete :argument, :name, full: true

  def search
    @search = params[:search].to_ascii if params[:search]
    @articles = Article.search(@search, params[:page]).includes(:revue).
      order("revue_id DESC").page(params[:page])
  end

  def show
    @revue = @article.revue
    @article_by_position = @revue.articles.find_by_position(@article.position)
    @prev = Article.prev(@article_by_position).first
    @next = Article.next(@article_by_position).first
    respond_with @article
  end

  def new
    @revue = Revue.find(params[:revue_id])
    @article = Article.new(revue_id: params[:revue_id])
    @article.build_argumentaire

    respond_with @article
  end

  def create
    @revue = Revue.find(params[:article][:revue_id])
    @article = Article.create(params[:article])
    if @article.save
      if params[:_save_and_continue]
        flash[:notice] = "Article '#{@article.full_title}' : création effectuée avec succès."
        location = edit_article_path(@article)
      elsif params[:_save_and_add_another]
        flash[:notice] = "Article '#{@article.full_title}' : modification effectuée avec succès."
      end
    end

    respond_with @article, location: location
  end

  def edit
    @revue = Revue.find(@article.revue_id)
    @article.build_argumentaire unless @article.argumentaire

    respond_with @article
  end

  def update
    @revue = Revue.find(@article.revue_id)
    @article.update_attributes(params[:article])

    if @article.save
      flash[:notice] = "Article '#{@article.full_title}' : modification effectuée avec succès."
      if params[:_save_and_continue]
        location = edit_article_path(@article)
      elsif params[:_save_and_add_another]
        location = new_article_path(revue_id: @revue.id)
      end
    end

    respond_with @article, location: location
  end

  private

  def set_article
    @article ||= params[:id] ? Article.find(params[:id]) : @revue.articles.build
  end
end
