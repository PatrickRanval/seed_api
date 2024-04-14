class VarietiesController < ApplicationController
  before_action :authenticate_request
  before_action :set_variety, only: [:show, :update, :destroy]

  def index
    # Check if search query parameter exists
    if params[:search].present?
      search_query = "%#{params[:search]}%"
      # Search for varieties where variety_name or type_name is similar to the search query
      varieties = Variety.joins(:type).where("varieties.name LIKE ? OR types.name LIKE ?", search_query, search_query)
    else
      # If no search query, return all varieties
      varieties = Variety.all
    end
    
    # Limit the number of results
    limit = params[:limit] || 10  # Default limit is 10, adjust as needed
    varieties = varieties.limit(limit)
    
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