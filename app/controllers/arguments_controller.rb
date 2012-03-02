class ArgumentsController < InheritedResources::Base
  respond_to :html

  def show
    @articles_as_main = Article.with_main_argument(resource).order("revue_id DESC").page(params[:page])
    @articles_as_aux = Article.with_aux_argument(resource).order("revue_id DESC").page(params[:page])
    show!
  end

  protected

  def collection
    @arguments ||= Argument.page(params[:page])
  end
end
