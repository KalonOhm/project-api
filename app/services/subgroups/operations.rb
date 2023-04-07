module Subgroups 
  module Operations
    def self.build_subgroup(params, current_user)
      group = Group.find(params[:group_id])

      subgroup = group.subgroups.build(subgroup_name: params[:subgroup_name])

      return ServiceContract.success(subgroup) if subgroup.save

      ServiceContract.error(subgroup.errors.full_messages)
    end

    def self.update_subgroup(params, group)
      subgroup = group.subgroups.find(params[:id])
      return ServiceContract.success(subgroup) if subgroup.update(subgroup_params(params))

      ServiceContract.error(subgroup.errors.full_messages)
    end

    def self.subgroup_params(params)
      params.require(:subgroup).permit(:subgroup_name)
    end
  end
end
