class RevuesController < InheritedResources::Base
  respond_to :html
  custom_actions collection: :archive

  helper_method :assigned_numero

  def archive
    @revues = Revue.order("numero DESC")
    @revue_annees = @revues.group_by(&:annee_sortie)
    @annees = @revue_annees.keys
  end

  def show
    @prev = resource_class.prev(resource).first
    @next = resource_class.next(resource).first
    @article = Article.new(:revue => resource)
    show!
  end

  protected

  def assigned_numero
    @assigned_numero ||= params[:id] ? resource.numero : resource_class.recent.first.numero + 1
  end

  def collection
    @revues ||= Revue.includes(:articles).recent.order("numero DESC").page(params[:page])
  end
end
