module Collections 
  module Operations
    def self.new_collection(params, current_user)
      collection = current_user.collections.new(
        name: params[:name],
        user_id: params[:user_id]
      )
      return ServiceContract.success(collection) if collection.save

      ServiceContract.error(collection.errors.full_messages)

    end
  end
end
