class ArgumentsController < InheritedResources::Base
  respond_to :html

  def index
    @unpaginated_arguments = Argument.order(:name)
    index! do |format|
      format.pdf do
        pdf = ArgumentPdf.new(@unpaginated_arguments)
        send_data pdf.render,
          filename: "vigitox_index",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

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
