class AuthorsController < InheritedResources::Base
  respond_to :html

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
