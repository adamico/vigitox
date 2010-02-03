class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
  end
  
  def show
    @categorie = Categorie.find(params[:id])
  end
  
  def new
    @categorie = Categorie.new
  end
  
  def create
    @categorie = Categorie.new(params[:categorie])
    if @categorie.save
      flash[:notice] = "Successfully created categorie."
      redirect_to @categorie
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
      flash[:notice] = "Successfully updated categorie."
      redirect_to @categorie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @categorie = Categorie.find(params[:id])
    @categorie.destroy
    flash[:notice] = "Successfully destroyed categorie."
    redirect_to categories_url
  end
end
