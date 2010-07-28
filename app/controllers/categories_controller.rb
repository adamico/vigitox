class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
  end
  
  def show
    @categorie = Categorie.find(params[:id])
    @articles = Article.joins(:categories).where(:categories => {:id => @categorie.id}).order("revue_id DESC").paginate(
      :page => params[:page], :per_page => 20)
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
