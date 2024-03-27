class VarietiesController < ApplicationController
  before_action :authenticate_request
  before_action :set_variety, only: [:show, :update, :destroy]

  def index
    varieties = Variety.all
    render json: VarietyBlueprint.render(varieties, view: :normal)
  end

  def show
    result = VarietyService::Base.show_variety(@variety)

    if result.success?
      render_success(payload: VarietyBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def create
    variety = VarietyService::Base.find_or_create_variety(variety_params)

    if variety.persisted?
      render json: variety, status: :ok
    else
      render json: { error: "Failed to create variety" }, status: :unprocessable_entity
    end
  end

  def update
    result = VarietyService::Base.update_variety(@variety, variety_params)

    if result.success?
      render_success(payload: VarietyBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    result = VarietyService::Base.destroy_variety(@variety)

    if result.success?
      render_success(payload: VarietyBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  private

  def set_variety
    @variety = Variety.find(params[:id])
  end

  def variety_params
    params.permit(:type_name, :variety_name)
  end
end

# class VarietiesController < ApplicationController
#     before_action :authenticate_request
    
#     def index
#       varieties = Variety.all
#       render json: VarietyBlueprint.render(varieties, view: :normal)
#     end
  
#     def show
#       variety = Variety.find(params[:id])
#       render json: VarietyBlueprint.render(variety, view: :normal)
#     end
  
#     def create
#       variety = find_or_create_variety
#       if variety.save
#         render json: variety, status: :ok
#       else
#         render json: { error: "Failed to create variety" }, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       variety = Variety.find(params[:id])
#       variety.update(variety_params)
  
#       render json: variety, status: :ok
#     end
  
#     def destroy
#       variety = Variety.find(params[:id])
#       if variety.destroy
#         render json: nil, status: :ok
#       else
#         render json: { error: "Failed to destroy variety" }, status: :unprocessable_entity
#       end
#     end
  
#     private
  
#     def variety_params
#       params.require(:variety).permit(:type_id, :name)
#     end
  
    # def find_or_create_variety
    #   type = Type.find_or_create_by(name: params[:type_name])
    #   variety = type.varieties.find_or_create_by(name: params[:variety_name])
    #   variety
    # end
#   end


  ##Exciting new logic curtosy of ActiveRecord find_or_create_by