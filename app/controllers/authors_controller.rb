class AuthorsController < ApplicationController
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
    @author = Author.find(params[:id])
    @articles = @author.articles.includes(:revue).
      page(params[:page]).order("revue_id DESC")
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to @author, :notice => "Successfully created author."
    else
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to @author, :notice => "Successfully updated author."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path, :notice => "Successfully destroyed author."
  end
end
