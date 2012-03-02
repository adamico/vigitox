class CategoriesController < InheritedResources::Base
  respond_to :html

  def show
    @articles = Article.includes(:revue).joins(:categories).
      where(:categories => {:id => resource.id}).
      order("revue_id DESC").
      page(params[:page])
    show!
  end
end
