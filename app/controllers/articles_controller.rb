# encoding: UTF-8

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
    @article_by_position = parent.articles.find_by_position(resource.position)
    @prev = resource_class.prev(@article_by_position).first
    @next = resource_class.next(@article_by_position).first
    show!
  end

  def create
    create! do |success, failure|
      success.html { redirect_on_success }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_on_success }
    end
  end

  private

  def redirect_on_success
    if params[:_save_and_continue]
      redirect_to edit_revue_article_path(parent, resource), notice: "L'article a été sauvegardé avec succès."
    elsif params[:_save_and_add_another]
      redirect_to new_revue_article_path(parent), notice: "L'article #{resource.full_title} a été sauvegardé."
    else
      redirect_to resource, notice: "L'article a été sauvegardé."
    end
  end
end
