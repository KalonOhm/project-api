
module Api
  module V1
      class MinisController < Api::V1::ApplicationController 
        before_action :get_subgroup

        before_action :set_mini, only: %i[show update destroy]

        # GET /api/v1/minis
        # GET /api/v1/minis.json
        def index
          minis = @subgroup.minis
          # render json: @minis
          payload = {
            minis: MiniBlueprint.render_as_hash(minis),
            status: 200
          }
          render_success(payload: payload)

        end

        # GET /api/v1/minis/1
        # GET /api/v1/minis/1.json
        def show
          # mini = @subgroup.minis.find(params[:id])
          payload = {
            mini: MiniBlueprint.render_as_hash(@mini),
            status: 200
          }
          render_success(payload: payload)
        end

        # POST /api/v1/minis
        # POST /api/v1/minis.json
        def create
          result = Minis::Operations.build_mini(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            mini: MiniBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
          
        end

        # PATCH/PUT /api/v1/minis/1
        # PATCH/PUT /api/v1/minis/1.json
        def update
          result = Minis::Operations.update_mini(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            mini: MiniBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)

        end

        # DELETE /api/v1/minis/1
        # DELETE /api/v1/minis/1.json
        def destroy
          # mini = @subgroup.minis.find(params[:id])
          @mini.delete
          render_success(payload: 'mini was successfully destroyed.', status: 200)
        end

        private
        def set_mini
          @mini = @subgroup.minis.find(params[:id])
        end
        def get_subgroup
          @subgroup = current_user.collections.find(params[:collection_id]).groups.find(params[:group_id).subgroups.find(params[:id])
        end
      end
    end
  end 
end 
