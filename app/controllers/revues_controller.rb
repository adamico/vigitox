class RevuesController < InheritedResources::Base
  respond_to :html, :js
  custom_actions collection: :archive

  def archive
    revues = Revue.order("numero DESC")
    @revue_annees = revues.group_by(&:annee_sortie)
    respond_with(@revue_annees)
  end

  def show
    @prev = resource_class.prev(resource).first
    @next = resource_class.next(resource).first
    @article = Article.new(:revue => resource)
    show!
  end

  protected

  def collection
    @revues ||= Revue.includes(:articles).recent.page(params[:page]).order("numero DESC")
  end
end
