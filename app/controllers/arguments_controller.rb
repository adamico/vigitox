class ArgumentsController < ApplicationController
  def index
    @arguments = Argument.page(params[:page])
  end

  def names
    @arguments = Argument.where(:name =~ "%#{params[:term]}%")
  end

  def show
    @argument = Argument.find(params[:id])
    @articles_as_main = @argument.articles_as_main
    @articles_as_aux = @argument.articles_as_aux
  end

  def new
    @argument = Argument.new
  end

  def create
    @argument = Argument.new(params[:argument])
    if @argument.save
      redirect_to @argument, :notice => "Successfully created argument."
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @argument = Argument.find(params[:id])
    @argument.destroy
    redirect_to arguments_path, :notice => "Successfully destroyed argument."
  end
end
