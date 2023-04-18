
module Api
  module V1
    module Users
      class CollectionsController < Api::V1::ApplicationController
        before_action :set_collection, only: %i[show update destroy]
        skip_before_action :authenticate, only: %i[home]

        def index
          collections = @current_user.collections
          payload = {
            collections: CollectionBlueprint.render_as_hash(collections, view: :expand),
            status: 200
          }
          render_success(payload: payload)
        end

        def show
          payload = {
            collection: CollectionBlueprint.render_as_hash(@collection, view: :expand),
            status: 200
          }
          render_success(payload: payload)
        end

        def create
          result = Collections::Operations.build_collection(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            collection: CollectionBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def update
          result = Collections::Operations.update_collection(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            collection: CollectionBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy
          @collection.delete
          render_success(payload: 'Collection was successfully deleted.', status: 200)
        end

        def home  
          render_success(payload: {preview: CollectionBlueprint.render_as_hash(Collection.order("RANDOM()").limit(3))}, status: 200)
        end

        private
        def set_collection
          @collection = @current_user.collections.find(params[:id])
        end
        
      end  
    end
  end 
end
