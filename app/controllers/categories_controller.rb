#encoding: utf-8
class CategoriesController < ApplicationController
  respond_to :html
  respond_to :pdf, only: [:index]

  before_filter :set_categorie, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Categorie.order("LOWER(name)")
    respond_with @categories do |format|
      format.html
      format.pdf do
        pdf = CategoriesPdf.new(@categories)
        send_data pdf.render,
          filename: "vigitox_categories_#{Date.today}",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  def show
    @articles = Article.includes(:revue).joins(:categories).
      where(categories: {id: @categorie.id}).
      order("revue_id DESC").
      page(params[:page])
    respond_with @categorie
  end

  def new
    @categorie = Categorie.new
    respond_with @categorie
  end

  def create
    @categorie = Categorie.create(categorie_params)
    flash[:notice] = "Catégorie '#{@categorie.name}' : création effectuée avec succès." if @categorie.save
    respond_with @categorie
  end

  def edit
    respond_with @categorie
  end

  def update
    @categorie.update_attributes(categorie_params)
    flash[:notice] = "Catégorie '#{@categorie.name}' : modification effectuée avec succès." if @categorie.save
    respond_with @categorie
  end

  def destroy
    @categorie.destroy
    flash[:notice] = "Catégorie '#{@categorie.name}' : destruction effectuée avec succès."
    respond_with @categorie, location: categories_path
  end

  protected

  def categorie_params
    params.require(:categorie).permit(:name)
  end

  def set_categorie
    @categorie = Categorie.find(params[:id])
  end
end
