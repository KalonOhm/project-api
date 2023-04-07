module Collections 
  module Operations
    def self.build_collection(collection_params, current_user)
      collection = current_user.collections.build(
        collection_name: collection_params[:collection_name]
      )
      return ServiceContract.success(collection) if collection.save

      ServiceContract.error(collection.errors.full_messages)
    end

    def self.update_collection(collection_params, current_user)
      collection = current_user.collections.find(collection_params[:id])
      return ServiceContract.success(collection) if collection.update(collection_name: collection_params[:collection_name])

      ServiceContract.error(collection.errors.full_messages)
    end
  end
end
