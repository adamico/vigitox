module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :restrict_access
      protect_from_forgery except: :index

      respond_to :json

      def index
        @articles = Article.search(params[:q]).includes(:revue).order("revue_id DESC")
        respond_with @articles.map(&:titre_and_revue).to_json
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
