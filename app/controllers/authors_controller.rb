class AuthorsController < ApplicationController
  def index
    @authors = Author.page(params[:page])
  end

  def names
    @authors = Author.where(:nom =~ "%#{params[:term]}%")
  end

  def show
    @author = Author.find(params[:id])
    @articles = @author.articles.includes(:revue).order("revue_id DESC").
      page(params[:page]).per(20)
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
