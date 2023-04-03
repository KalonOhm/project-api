module Groups 
  module Operations
    def self.build_group(group_params, collection, current_user)
      group = current_user.collection.groups.build(
        group_name: group_params[:group_name]
      )
      return ServiceContract.success(group) if group.save

      ServiceContract.error(group.errors.full_messages)

    end

    def self.update_group(group_params, collection, current_user)
      group = current_user.collection.groups.find(group_params[:id])
      return ServiceContract.success(group) if group.group.update(group_name: group_params[:group_name])

      ServiceContract.error(group.errors.full_messages)


  end
end
