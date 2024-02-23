class VarietiesController < ApplicationController
    def index
        varieties = Variety.all
        render json: varieties
    end

    def show
        variety = Variety.find(params[:id])
        render json: variety
    end
    
    def create
        variety = Variety.new(type_id: variety_params[:type_id], name: variety_params[:name])
        if variety.save
            render json: variety
        else 
            render json: { error: "Variety already exists or some other fail" }, status: :unprocessable_entity
        end
    end

    def update
        variety = Variety.find(params[:id])
        variety.update(type_id: variety_params[:type_id], name: variety_params[:name])
    
        render json: variety
    end

    def destroy
        variety = Variety.find(params[:id])
        variety.destroy
    
        render json: variety
    end
    
    
    def variety_params
        permitted_params = params.permit(:type_name, :type_id, :name)
      
        # If type_id is not present but type_name is, find it and add to permitted_params
        if !permitted_params[:type_id] && permitted_params[:type_name]
          type = Type.find_by(name: permitted_params[:type_name])
      
          if type.nil?
            render json: { error: "Invalid type_name. Type not found." }, status: :unprocessable_entity
            return
          else
            permitted_params[:type_id] = type.id
          end
        end
        permitted_params
      end

end
