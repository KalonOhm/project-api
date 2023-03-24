require 'rails_helper'

RSpec.describe "Api::V1::PaintSchemePaints", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/paint_scheme_paints/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/paint_scheme_paints/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/paint_scheme_paints/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/paint_scheme_paints/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/paint_scheme_paints/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
