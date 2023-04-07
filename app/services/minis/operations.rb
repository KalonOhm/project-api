module Minis 
  module Operations
    def self.build_mini(mini_params, subgroup)
      mini = subgroup.minis.build(
        mini_params
      )
      return ServiceContract.success(mini) if mini.save

      ServiceContract.error(mini.errors.full_messages)

    end

    def self.update_mini(mini_params, subgroup)
      mini = subgroup.minis.find(mini_params[:id])
      return ServiceContract.success(mini) if mini.update(
        mini_name: mini_params[:mini_name],
        description: mini_params[:description],
        quantity: mini_params[:quantity],
        loadout: mini_params[:loadout],
        image: mini_params[:image]
      )

      ServiceContract.error(mini.errors.full_messages)
    end
  end
end
