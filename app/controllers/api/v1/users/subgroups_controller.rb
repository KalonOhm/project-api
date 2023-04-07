
module Api
  module V1
    module Users
      class SubgroupsController < Api::V1::ApplicationController
        before_action :get_group_collection
        before_action :set_subgroup, only: %i[show update destroy]

        # GET /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups
        # GET /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups.json
        def index
          subgroups = @group.subgroups
          # render json: @subgroups
          payload = {
            subgroups: SubgroupBlueprint.render_as_hash(subgroups),
            status: 200
          }
          render_success(payload: payload)
        end

        # GET /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1
        # GET /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1.json
        def show
          # subgroup = @group.subgroups.find(params[:id])
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(@subgroup),
            status: 200
          }
          render_success(payload: payload)
        end

        # POST /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups
        # POST /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups.json
        def create
          
          result = Subgroups::Operations.build_subgroup(params, @current_user)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
          
        end

        # PATCH/PUT /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1
        # PATCH/PUT /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1.json
        def update
          result = Subgroups::Operations.update_subgroup(subgroup_params, @group)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)

        end

         # DELETE /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1
        # DELETE /api/v1/users/:user_id/collections/:collection_id/groups/:group_id/subgroups/1.json
        def destroy
          # subgroup = @group.subgroups.find(params[:id])
          @subgroup.delete
          render_success(payload: 'Subgroup was successfully destroyed.', status: 200)
        end

        private
        def set_subgroup
          @subgroup = @group.subgroups.find(params[:id])
        end

        def subgroup_params
          params.require(:subgroup).permit(:subgroup_name)
        end

        def get_group_collection
          @collection = @current_user.collections.find(params[:collection_id])
          @group = @collection.groups.find(params[:group_id])
        end
      end
    end
  end
end
