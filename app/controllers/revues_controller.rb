class RevuesController < ApplicationController
  def index
    @revues = Revue.order("numero DESC").paginate(:page => params[:page])
    @derniere = Revue.derniere
  end
  
  def show
    @revue = Revue.includes(:articles).find(params[:id])
    @prev = Revue.prev(@revue).first
    @next = Revue.next(@revue).first
    @article = Article.new(:revue => @revue)

  end
  
  def new
    @revue = Revue.new
  end
  
  def create
    @revue = Revue.new(params[:revue])
    if @revue.save
      flash[:notice] = "Successfully created revue."
      redirect_to @revue
    else
      render :action => 'new'
    end
  end
  
  def edit
    @revue = Revue.find(params[:id])
  end
  
  def update
    @revue = Revue.find(params[:id])
    if @revue.update_attributes(params[:revue])
      flash[:notice] = "Successfully updated revue."
      redirect_to @revue
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @revue = Revue.find(params[:id])
    @revue.destroy
    flash[:notice] = "Successfully destroyed revue."
    redirect_to revues_url
  end
end
