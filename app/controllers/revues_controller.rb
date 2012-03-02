class RevuesController < InheritedResources::Base
  respond_to :html
  custom_actions collection: :archive

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

  def collection
    @revues ||= Revue.includes(:articles).recent.order("numero DESC").page(params[:page])
  end
end
