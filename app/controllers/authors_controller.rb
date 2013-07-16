#encoding: utf-8
class AuthorsController < ApplicationController
  respond_to :html
  before_filter :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.page(params[:page])
  end

  def names
    @authors = Author.where("LOWER(nom) like ?", "%#{params[:q]}%").order(:nom)
    respond_to do |format|
      format.json { render json: @authors}
    end
  end

  def show
    @articles = @author.articles.includes(:revue).
      page(params[:page]).order("revue_id DESC")
    respond_with @author
  end

  def new
    @author = Author.new
    respond_with @author
  end

  def create
    @author = Author.create(params[:author])
    flash[:notice] = "Auteur '#{@author.to_param}' : création effectuée avec succès." if @author.save
    respond_with @author
  end

  def edit
    respond_with @author
  end

  def update
    @author.update_attributes(params[:author])
    flash[:notice] = "Auteur '#{@author.to_param}' : modification effectuée avec succès." if @author.save
    respond_with @author
  end

  def destroy
    @author.destroy
    flash[:notice] = "Auteur '#{@author.to_param}' : destruction effectuée avec succès."
    respond_with @author, location: authors_path
  end

  protected

  def set_author
    @author = Author.find_by_slug(params[:id])
  end
end
