module Api
  module V1
    class ArticlesController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      def index
        @articles = Article.search(params[:q]).includes(:revue).order("revue_id DESC")
        respond_with @articles.to_json
      end

      private

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
