class TypesController < ApplicationController
    before_action :set_type, only: [:show, :update, :destroy]

    def index
      types = Type.all
      render json: types, status: :ok
    end
  
    
    def create
      result = TypeService::Base.create_type(type_params)
      
      if result.success?
        render_success(payload: TypeBlueprint.render_as_hash(result.payload, view: :normal), status: :created)
      else
        render_error(errors: result.errors, status: :unprocessable_entity)
      end
    end
    
    def show
      result = TypeService::Base.show_type(@type)

      if result.success?
        render_success(payload: TypeBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
      else
        render_error(errors: result.errors, status: :unprocessable_entity)
      end
    end
  
    def update
      result = TypeService::Base.update_type(@type, type_params)

      if result.success?
        render_success(payload: TypeBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
      else
        render_error(errors: result.errors, status: :unprocessable_entity)
      end
    end
  
    def destroy
      result = TypeService::Base.destroy_type(@type)
      
      if result.success?
        render_success(payload: TypeBlueprint.render_as_hash(result.payload, view: :normal), status: :ok)
      else
        render_error(errors: result.errors, status: :unprocessable_entity)
      end
    end
  
    private
  
    def set_type
      @type = Type.find(params[:id])
    end
  
    def type_params
      params.permit(:name)
    end
end
