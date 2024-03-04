class VarietiesController < ApplicationController
    before_action :authenticate_request
    def index
        varieties = Variety.all
        render json: VarietyBlueprint.render(varieties, view: :normal)
    end

    def show
        variety = Variety.find(params[:id])
        render json: VarietyBlueprint.render(variety, view: :normal)
    end

    def create
        variety = Variety.new(variety_params)
        if variety.save
            render json: variety, status: :ok
        else
            render json: { error: "Variety already exists or some other fail" }, status: :unprocessable_entity
        end
    end

    def update
        variety = Variety.find(params[:id])
        variety.update(variety_params)

        render json: variety, status: :ok
    end

    def destroy
        variety = Variety.find(params[:id])
        if variety.destroy
            render json: nil, status: :ok
          else
            render json: variety.errors, status: :unprocessable_entity
          end
    end


    def variety_params
        params.require(:type_id)
        params.require(:name)

        if !Type.exists?(params[:type_id])
            render json: { error: "Invalid type_id. Type not found." }, status: :unprocessable_entity
            return
        end

        { type_id: params[:type_id], name: params[:name] }
    end
end
