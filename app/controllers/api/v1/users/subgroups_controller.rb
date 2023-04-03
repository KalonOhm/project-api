
module Api
  module V1
      class SubgroupsController < Api::V1::ApplicationController
        before_action :get_group

        before_action :set_subgroup, only: %i[show update destroy]

        # GET /api/v1/subgroups
        # GET /api/v1/subgroups.json
        def index
          subgroups = @group.subgroups
          # render json: @subgroups
          payload = {
            subgroups: SubgroupBlueprint.render_as_hash(subgroups),
            status: 200
          }
          render_success(payload: payload)

        end

        # GET /api/v1/subgroups/1
        # GET /api/v1/subgroups/1.json
        def show
          # subgroup = @group.subgroups.find(params[:id])
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(@subgroup),
            status: 200
          }
          render_success(payload: payload)
        end

        # POST /api/v1/subgroups
        # POST /api/v1/subgroups.json
        def create
          result = Subgroups::Operations.build_subgroup(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
          
        end

        # PATCH/PUT /api/v1/subgroups/1
        # PATCH/PUT /api/v1/subgroups/1.json
        def update
          result = Subgroup::Operations.update_subgroup(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            subgroup: SubgroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)

        end

        # DELETE /api/v1/subgroups/1
        # DELETE /api/v1/subgroups/1.json
        def destroy
          # subgroup = @group.subgroups.find(params[:id])
          @subgroup.delete
          render_success(payload: 'subgroup was successfully destroyed.', status: 200)
        end

        private
        def set_subgroup
          @subgroup = @group.subgroups.find(params[:id])
        end
        def get_group
          @group = current_user.collections.find(params[:collection_id]).groups.find(params[:id])
        end
      end
    end
  end
end
