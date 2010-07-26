class ArgumentsController < ApplicationController
  def index
    @arguments_paginate = Argument.order("LOWER(name) ASC").paginate(:page => params[:page], :per_page => 20)
    @arguments = Argument.where(['name LIKE ?', "%#{params[:search]}%"]).order("LOWER(name) ASC")
  end
  
  def show
    @argument = Argument.find(params[:id])
  end
  
  def new
    @argument = Argument.new
  end
  
  def create
    @argument = Argument.new(params[:argument])
    if @argument.save
      flash[:notice] = "Successfully created argument."
      redirect_to @argument
    else
      render :action => 'new'
    end
  end
  
  def edit
    @argument = Argument.find(params[:id])
  end
  
  def update
    @argument = Argument.find(params[:id])
    if @argument.update_attributes(params[:argument])
      flash[:notice] = "Successfully updated argument."
      redirect_to @argument
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @argument = Argument.find(params[:id])
    @argument.destroy
    flash[:notice] = "Successfully destroyed argument."
    redirect_to arguments_url
  end
end
