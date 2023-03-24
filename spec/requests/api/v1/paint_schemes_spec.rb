require 'rails_helper'

RSpec.describe "Api::V1::PaintSchemes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/paint_schemes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/paint_schemes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/paint_schemes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/paint_schemes/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/paint_schemes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
