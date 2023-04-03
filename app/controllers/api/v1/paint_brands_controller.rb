
module Api
  module V1
    class PaintBrandsController < Api::V1::ApplicationController

      #GET /api/v1/paint_brands
      #GET /api/v1/paint_brands.json
      def index
        brands = PaintBrand.all
        payload = {
          paint_brands: PaintBrandBlueprint.render_as_hash(brands),
          status: 200
        }
        render_success(payload: payload)
      end

      #GET /api/v1/paint_brands/1
      #GET /api/v1/paint_brands/1.json
      def show 
        payload = {
          paint_brand: PaintBrandBlueprint.render_as_hash(@paint_brand),
          status: 200
        }
        render_success(payload: payload)
      end

      def create
        result = Creations::Operations.build_paint_brand(params)

      private 
      def set_paint_brand
        @paint_brand = PaintBrand.find(params[:id])
      end

    end
  end
end
