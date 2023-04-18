
module Api
  module V1
    module Users
      class SubgroupsController < Api::V1::ApplicationController
        before_action :get_group_collection
        before_action :set_subgroup, only: %i[show update destroy]

        def index
          subgroups = @group.subgroups
          payload = {
            subgroups: SubgroupBlueprint.render_as_hash(subgroups, view: :expand),
            status: 200
          }
          render_success(payload: payload)
        end

        def show
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(@subgroup, view: :expand),
            status: 200
          }
          render_success(payload: payload)
        end

        def create
          result = Subgroups::Operations.build_subgroup(subgroup_params, @group)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)  
        end

        def update
          result = Subgroups::Operations.update_subgroup(params, @group)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy
          @subgroup.delete
          render_success(payload: 'Subgroup successfully deleted.', status: 200)
        end

        private
        def set_subgroup
          @subgroup = @group.subgroups.find(params[:id])
        end
        def get_group_collection
          @collection = @current_user.collections.find(params[:collection_id])
          @group = @collection.groups.find(params[:group_id])
        end
        def subgroup_params
          params.require(:subgroup).permit(:subgroup_name)
        end
      end
    end
  end
end
