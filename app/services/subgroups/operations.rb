module Subgroups 
  module Operations
    def self.build_subgroup(subgroup_params)
      subgroup = @group.subgroups.build(
        subgroup_name: subgroup_params[:subgroup_name]
      )
      return ServiceContract.success(subgroup) if subgroup.save

      ServiceContract.error(subgroup.errors.full_messages)

    end

    def self.update_subgroup(subgroup_params)
      subgroup = @group.subgroups.find(subgroup_params[:id])
      return ServiceContract.success(subgroup) if subgroup.update(subgroup_params[:subgroup_name])

      ServiceContract.error(subgroup.errors.full_messages)
    end
  end
end
