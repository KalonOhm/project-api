module Groups 
  module Operations
    def self.build_group(group_params)
      group = @collection.groups.build(
        group_name: group_params[:group_name]
      )
      return ServiceContract.success(group) if group.save

      ServiceContract.error(group.errors.full_messages)

    end

    def self.update_group(group_params)
      group = @collection.groups.find(params[:id])
      return ServiceContract.success(group) if group.update(group_params[:group_name])

      ServiceContract.error(group.errors.full_messages)


  end
end
