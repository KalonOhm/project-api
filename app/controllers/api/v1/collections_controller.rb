class Api::V1::CollectionsController < ApplicationController
  def index
    # don't need to access all collections, just thouse belonging to the current user
    @collections = current_user.collections
    render json: @collections
  end

  def show
    @collection = current_user.collections.find(params[:id])
    render json: @collection 
  rescue ActiveRecord::RecordNotFound 
    render json: {error: "Collection not found"}, status: :not_found
  end

  def create
    result = Creations::Operations.new_collection(params, @current_user)
    render_error(errors: result.errors.all, status: 400) and return unless result.success?
    payload = {
      collection: result.payload,
      status: 201
    }
    render_success(payload: payload)
    # @collection = current_user.collections.build(collection_params) 

    # if @collection.save
    #   render json: @collection, status: 200, location: [:api, @collection]
    # else 
    #   render json: @collections.errors, status: :unprocessable_entity
    # end
  end

  def update
    @collection = current_user.collections.find(params[:id])

    if @collection.update(collection_params)
      render json: @collection, status: 200, location: [:api, @collection]
    else
      render json: @collection.errors, status: :unprocessable_entity
    end 
  end

  def destroy
    @collection = current_user.collections.find(params[:id])
    @collection.destroy
  end
end
