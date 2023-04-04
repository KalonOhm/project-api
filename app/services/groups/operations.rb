module Groups 
  module Operations
    def self.build_group(group_params, collection_id, current_user)
      # group = current_user.groups.build(
      #   group_params.merge(
      #     collection_id: collection_id, 
      #     group_name: group_params[:group_name]
      #   )
      # )
      # group.collection = Collection.find(collection_id)
      # group.user_id = @current_user.id
      collection = current_user.collections.find(collection_id)
      group = collection.groups.build(group_params)

      return ServiceContract.success(group) if group.save

      ServiceContract.error(group.errors.full_messages)
    end

    def self.update_group(group_params, collection_id, current_user)
      group = current_user.collection.groups.find(group_params[:id])
      return ServiceContract.success(group) if group.group.update(group_name: group_params[:group_name])

      ServiceContract.error(group.errors.full_messages)

    end
  end
end
