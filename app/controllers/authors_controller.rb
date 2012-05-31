class AuthorsController < InheritedResources::Base
  respond_to :html

  def names
    @authors = Author.where("LOWER(nom) like ?", "%#{params[:q]}%").order(:nom)
    respond_to do |format|
      format.json { render :json => @authors}
    end
  end

  def show
    @articles = resource.articles.includes(:revue).
      page(params[:page]).order("revue_id DESC")
    show!
  end

  protected

  def collection
    @authors ||= Author.page(params[:page])
  end
end
