class ArgumentsController < ApplicationController
  def index
    @arguments_paginate = Argument.order("LOWER(name) ASC").paginate(:page => params[:page], :per_page => 20)
    @arguments = Argument.where(['name LIKE ?', "%#{params[:search]}%"]).order("LOWER(name) ASC")
  end

  def names
    @arguments = Argument.where(:name =~ "%#{params[:term]}%")
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
      redirect_to @argument, :notice => "Successfully created argument."
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
      redirect_to @argument, :notice => "Successfully updated argument."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @argument = Argument.find(params[:id])
    @argument.destroy
    redirect_to arguments_path, :notice => "Successfully destroyed argument."
  end
end
