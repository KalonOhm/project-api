module Collections 
  module Operations
    def self.build_collection(collection_params)
      collection = current_user.collections.build(
        collection_name: collection_params[:collection_name]
      )
      return ServiceContract.success(collection) if collection.save

      ServiceContract.error(collection.errors.full_messages)

    end

    def self.update_collection(collection_params)
      collection = current_user.collections.find(params[:id])
      return ServiceContract.success(collection) if collection.update(collection_params[:collection_name])

      ServiceContract.error(collection.errors.full_messages)


  end
end
