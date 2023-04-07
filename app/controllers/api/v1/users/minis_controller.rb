
module Api
  module V1
    module Users
      class MinisController < Api::V1::ApplicationController 
        before_action :get_subgroup_group_collection
        before_action :set_mini, only: %i[show update destroy]

        def index
          minis = @subgroup.minis
          payload = {
            minis: MiniBlueprint.render_as_hash(minis),
            status: 200
          }
          render_success(payload: payload)
        end

        def show
          payload = {
            mini: MiniBlueprint.render_as_hash(@mini),
            status: 200
          }
          render_success(payload: payload)
        end

        def create
          result = Minis::Operations.build_mini(mini_params, @subgroup)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            mini: MiniBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def update
          result = Minis::Operations.update_mini(params, @subgroup)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            mini: MiniBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy
          @mini.delete
          render_success(payload: 'Mini successfully deleted.', status: 200)
        end

        private
        def set_mini
          @mini = @subgroup.minis.find(params[:id])
        end
        def get_subgroup_group_collection
          @collection = @current_user.collections.find(params[:collection_id])
          @group = @collection.groups.find(params[:group_id])
          @subgroup = @group.subgroups.find(params[:subgroup_id])
        end
        def mini_params
          params.require(:mini).permit(:mini_name, :loadout, :quantity, :description, :image, :subgroup_id)
        end
      end
    end
  end 
end 
