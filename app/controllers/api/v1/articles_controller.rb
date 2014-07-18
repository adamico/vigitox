module Api
  module V1
    class ArticlesController < ApplicationController
      protect_from_forgery except: :index

      respond_to :json

      def index
        @articles = Article.search(params[:q]).includes(:revue)
        respond_with @articles.map(&:id_titre_and_revue)
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
