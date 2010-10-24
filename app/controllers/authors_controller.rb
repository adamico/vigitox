class AuthorsController < ApplicationController
  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 20,
                               :include => :authorships, :order => :nom)
  end

  def names
    @authors = Author.all(:conditions => ["nom LIKE ?", "%#{params[:term]}%"])
  end

  def show
    @author = Author.find(params[:id])
    @articles = Article.paginate(:page => params[:page], :per_page => 20,
                                 :joins => :authorships,
                                 :conditions => { 'authorships.author_id'  => @author.id},
                                 :order => 'revue_id DESC')
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
