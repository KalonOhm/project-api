module Groups 
  module Operations
    def self.build_group(group_params, collection)
      group = collection.groups.build(group_params)
      # group.user_id = user_id
      
      
      return ServiceContract.success(group) if group.save

      ServiceContract.error(group.errors.full_messages)
    end

    def self.update_group(params, collection)
      group = collection.groups.find(params[:id])
      return ServiceContract.success(group) if group.update(group_params(params))

      ServiceContract.error(group.errors.full_messages)
    end

    def self.group_params(params)
      params.require(:group).permit(:group_name)
    end
  end
end
