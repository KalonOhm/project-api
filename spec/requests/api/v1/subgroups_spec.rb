require 'rails_helper'

RSpec.describe "Api::V1::Subgroups", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/subgroups/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/subgroups/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/subgroups/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/subgroups/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/subgroups/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
