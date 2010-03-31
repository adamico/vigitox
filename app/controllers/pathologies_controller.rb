class PathologiesController < ApplicationController
  def index
    @pathologies = Pathologie.all(:order => 'name ASC', :include => :articles)
  end
  
  def show
    @pathologie = Pathologie.find(params[:id])
    @articles = @pathologie.articles.all(:order => 'titre ASC')
  end
  
  def new
    @pathologie = Pathologie.new
  end
  
  def create
    @pathologie = Pathologie.new(params[:pathologie])
    if @pathologie.save
      flash[:notice] = "Successfully created pathologie."
      redirect_to @pathologie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pathologie = Pathologie.find(params[:id])
  end
  
  def update
    @pathologie = Pathologie.find(params[:id])
    if @pathologie.update_attributes(params[:pathologie])
      flash[:notice] = "Successfully updated pathologie."
      redirect_to @pathologie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pathologie = Pathologie.find(params[:id])
    @pathologie.destroy
    flash[:notice] = "Successfully destroyed pathologie."
    redirect_to pathologies_url
  end
end
