
module Api
  module V1
    module Users
      class GroupsController < Api::V1::ApplicationController  
        before_action :get_collection
        before_action :set_group, only: %i[show update destroy]

        # GET /api/v1/users/:user_id/collections/:collection_id/groups
        # GET /api/v1/users/:user_id/collections/:collection_id/groups.json
        def index
          groups = @collection.groups
          # render json: @groups
          payload = {
            groups: GroupBlueprint.render_as_hash(groups),
            status: 200
          }
          render_success(payload: payload)
        end

        # GET /api/v1/users/:user_id/collections/:collection_id/groups/1
        # GET /api/v1/users/:user_id/collections/:collection_id/groups/1.json
        def show
          payload = {
            group: GroupBlueprint.render_as_hash(@group),
            status: 200
          }
          render_success(payload: payload)
        end

        def create
          result = Groups::Operations.build_group(group_params, @collection)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            group: GroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def update
          result = Groups::Operations.update_group(params, @collection)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            group: GroupBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy
          group.delete
          render_success(payload: 'Group successfully deleted.', status: 200)
        end

        private
        def set_group
          @group = @collection.groups.find(params[:id])
        end
        def get_collection
          @collection = @current_user.collections.find(params[:collection_id])
        end
        def group_params
          params.require(:group).permit(:group_name)
        end
      end
    end
  end 
end
