#encoding: utf-8
class ArgumentsController < ApplicationController
  respond_to :html
  respond_to :json, :pdf, only: [:index]

  before_filter :set_argument, only: [:show, :edit, :update, :destroy]

  def index
    @arguments = Argument.order(:name)
    respond_with @arguments do |format|
      format.html { @arguments = @arguments.page(params[:page]) }
      format.json
      format.pdf do
        pdf = ArgumentPdf.new(@arguments)
        send_data pdf.render,
          filename: "vigitox_index",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  def show
    @articles_as_main = Article.with_main_argument(@argument).order("revue_id DESC").page(params[:page])
    @articles_as_aux = Article.with_aux_argument(@argument).order("revue_id DESC").page(params[:page])
    respond_with @argument
  end

  def new
    @argument = Argument.new
    respond_with @argument
  end

  def create
    @argument = Argument.create(params[:argument])
    flash[:notice] = "Argument '#{@argument.name}' : création effectuée avec succès." if @argument.save
    respond_with @argument
  end

  def edit
    respond_with @argument
  end

  def update
    @argument.update_attributes(params[:argument])
    flash[:notice] = "Argument '#{@argument.name}' : modification effectuée avec succès." if @argument.save
    respond_with @argument
  end

  def destroy
    @argument.destroy
    flash[:notice] = "Argument '#{@argument.name}' : destruction effectuée avec succès."
    respond_with @argument, location: arguments_path
  end

  protected

  def set_argument
    @argument = Argument.find_by_slug(params[:id])
  end
end
