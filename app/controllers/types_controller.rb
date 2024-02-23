class TypesController < ApplicationController
    before_action :set_type, only: [:show, :update, :destroy]

    def index
      types = Type.all
      render json: types, status: :ok
    end
  
    def show
        render json: @type, status: :ok
    end
  
    def create
      type = Type.new(type_params)
  
      if type.save
        render json: type, status: :ok
      else
        render json: { error: "Type already exists or some other fail" }, status: :unprocessable_entity
      end
    end
 
  
    def update
      if @type.update(type_params)
        render json: @type, status: :ok
      else
        render json: { error: "Some kinda fail" }, status: :unprocessable_entity
      end
    end
  
    def destroy
        if @type.destroy
            render json: nil, status: :ok
          else
            render json: @type.errors, status: :unprocessable_entity
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
