module Groups 
  module Operations
    def self.build_group(group_params, collection)
      group = collection.groups.build(group_params)
      
      return ServiceContract.success(group) if group.save

      ServiceContract.error(group.errors.full_messages)
    end

    def self.update_group(group_params, collection)
      group = collection.groups.find(group_params[:id])
      return ServiceContract.success(group) if group.update(group_name: group_params[:group_name])

      ServiceContract.error(group.errors.full_messages)
    end
  end
end
