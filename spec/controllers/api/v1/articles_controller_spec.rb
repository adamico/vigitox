require 'spec_helper'

describe Api::V1::ArticlesController do
  describe "GET :index" do
    let!(:token) { ApiKey.create!.access_token }
    it "should respond with unauthorized status without a token" do
      get :index, format: :json
      expect(response.status).to eq(401)
    end
    it "should respond with unauthorized status with an invalid token" do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials("blablabla123")
      get :index, format: :json
      expect(response.status).to eq(401)
    end
    it "should be successful with an existing api token" do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(token)
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end
end
