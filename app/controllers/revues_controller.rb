#encoding: utf-8
class RevuesController < ApplicationController
  respond_to :html
  before_filter :set_revue, only: [:show, :edit, :update, :destroy]
  helper_method :assigned_numero

  def index
    @revues = Revue.includes(:articles).order("numero DESC")
    @revue_annees = @revues.group_by(&:annee_sortie)
    @annees = @revue_annees.keys
    respond_with @revues
  end

  def show
    @prev = Revue.prev(@revue)
    @next = Revue.next(@revue)
    respond_with @revue
  end

  def new
    @revue = Revue.new
    @revue.build_editorial

    respond_with @revue
  end

  def create
    @revue = Revue.create(params[:revue])
    flash[:notice] = 'Revue enregistrée avec succès.' if @revue.save
    respond_with @revue
  end

  def edit
    @revue.build_editorial unless @revue.editorial
    respond_with @revue
  end

  def update
    @revue.update_attributes(params[:revue])

    flash[:notice] = "Vigitox n° #{@revue.numero} : modification effectuée avec succès." if @revue.save
    respond_with @revue
  end

  protected

  def set_revue
    @revue = Revue.find(params[:id])
  end

  def assigned_numero
    if Revue.any?
      @assigned_numero ||= params[:id] ? @revue.numero : Revue.recent.first.numero + 1
    end
  end
end
