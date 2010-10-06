class AuthorsController < ApplicationController
  def index
    if params[:search]
      @authors = Author.all(:order => :nom, :conditions => ['nom LIKE ?', "%#{params[:search]}%"])
    else
      @authors = Author.all(:include => :authorships, :order => :nom)
    end
  end

  def names
    @authors = Author.all(:conditions => ["nom LIKE ?", "%#{params[:term]}%"])
  end

  def show
    @author = Author.find(params[:id])
  end
  
  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "Successfully created author."
      redirect_to @author
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
      flash[:notice] = "Successfully updated author."
      redirect_to @author
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Successfully destroyed author."
    redirect_to authors_url
  end
end
