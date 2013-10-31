module Api
  module V1
    class ArticlesController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      def index
        respond_with Article.all
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
