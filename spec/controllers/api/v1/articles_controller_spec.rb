require 'spec_helper'

describe Api::V1::ArticlesController do
  describe "GET :index" do
    it "should be successful" do
      get :index, format: :json
    end
  end
end
