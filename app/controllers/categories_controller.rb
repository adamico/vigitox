class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
  end

  def show
    @categorie = Categorie.find(params[:id])
    @articles = Article.includes(:revue).joins(:categories).
      where(:categories => {:id => @categorie.id}).
      order("revue_id DESC").
      page(params[:page])
  end

  def new
    @categorie = Categorie.new
  end

  def create
    @categorie = Categorie.new(params[:categorie])
    if @categorie.save
      redirect_to @categorie, :notice => "Successfully created categorie."
    else
      render :action => 'new'
    end
  end

  def edit
    @categorie = Categorie.find(params[:id])
  end

  def update
    @categorie = Categorie.find(params[:id])
    if @categorie.update_attributes(params[:categorie])
      redirect_to @categorie, :notice => "Successfully updated categorie."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @categorie = Categorie.find(params[:id])
    @categorie.destroy
    redirect_to categories_path, :notice => "Successfully destroyed categorie."
  end
end
