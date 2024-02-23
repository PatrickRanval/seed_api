class SourcesController < ApplicationController
    before_action :set_source, only: [:show, :update, :destroy]

    def index
      sources = Source.all
      render json: sources, status: :ok
    end
  
    def show
        render json: @source, status: :ok
    end
  
    def create
      source = Source.new(source_params)
  
      if source.save
        render json: source, status: :ok
      else
        render json: { error: "Source already exists or some other fail" }, status: :unprocessable_entity
      end
    end
 
  
    def update
      if @source.update(source_params)
        render json: @source, status: :ok
      else
        render json: { error: "Some kinda fail" }, status: :unprocessable_entity
      end
    end
  
    def destroy
        if @source.destroy
            render json: nil, status: :ok
          else
            render json: @source.errors, status: :unprocessable_entity
          end
    end
  
    private
  
    def set_source
        @source = Source.find(params[:id])
    end
  
    def source_params
        params.require(:name)
        params.permit(:name, :website)
    end
end
