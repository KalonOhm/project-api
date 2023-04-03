
module Api
  module V1
    module Users
      class CollectionsController < Api::V1::ApplicationController
        before_action :set_collection, only: %i[show update destroy]

        # GET /api/v1/collections
        # GET /api/v1/collections.json
        def index
          collections = @current_user.collections
          # render json: @collections
          payload = {
            collections: CollectionBlueprint.render_as_hash(collections),
            status: 200
          }
          render_success(payload: payload)

        end

        # GET /api/v1/collections/1
        # GET /api/v1/collections/1.json
        def show
          payload = {
            collection: CollectionBlueprint.render_as_hash(@collection),
            status: 200
          }
          render_success(payload: payload)
        end

        # POST /api/v1/collections
        # POST /api/v1/collections.json
        def create
          result = Collections::Operations.build_collection(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            collection: CollectionBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
          
        end

        # PATCH/PUT /api/v1/collections/1
        # PATCH/PUT /api/v1/collections/1.json
        def update
          result = Collections::Operations.update_collection(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            collection: CollectionBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)

        end

        # DELETE /api/v1/collections/1
        # DELETE /api/v1/collections/1.json
        def destroy
          # collection = @current_user.collections.find(params[:id])
          @collection.delete
          render_success(payload: 'Collection was successfully deleted.', status: 200)
        end

        private
        def set_collection
          @collection = @current_user.collections.find(params[:id])
        end
        
      end  
    end
  end 
end