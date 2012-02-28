class RevuesController < InheritedResources::Base
  respond_to :html, :js
  custom_actions collection: :archive

  def archive
    revues = Revue.order("numero DESC")
    @revue_annees = revues.group_by(&:annee_sortie)
    respond_with(@revue_annees)
  end

  def show
    @revue = Revue.find(params[:id])
    @prev = Revue.prev(@revue).first
    @next = Revue.next(@revue).first
    @article = Article.new(:revue => @revue)
    show!
  end

  protected

  def collection
    @revues ||= Revue.includes(:articles).recent.page(params[:page])
  end
end
