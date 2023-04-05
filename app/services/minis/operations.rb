module Minis 
  module Operations
    def self.build_mini(mini_params)
      mini = @subgroup.minis.build(
        mini_name: mini_params[:mini_name]
      )
      return ServiceContract.success(mini) if mini.save

      ServiceContract.error(mini.errors.full_messages)

    end

    def self.update_mini(mini_params)
      mini = @subgroup.minis.find(params[:id])
      return ServiceContract.success(mini) if mini.update(mini_params[:mini_name])

      ServiceContract.error(mini.errors.full_messages)
    end
  end
end
