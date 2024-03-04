class TraysController < ApplicationController
    before_action :set_tray, only: [:show, :update, :destroy]
  
    def index
      trays = Tray.all
      render json: trays, status: :ok
    end
  
    def show
      render json: @tray, status: :ok
    end
  
    def create
      tray = Tray.new(tray_params)
  
      if tray.save
        render json: tray, status: :ok
      else
        render json: { error: "Tray already exists or some other fail" }, status: :unprocessable_entity
      end
    end
  
    def update
      if @tray.update(tray_params)
        render json: @tray, status: :ok
      else
        render json: { error: "Some kinda fail" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @tray.destroy
        render json: nil, status: :ok
      else
        render json: @tray.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_tray
      @tray = Tray.find(params[:id])
    end
  
    def tray_params
      params.permit(:name, :cells_short, :cells_long)
    end
  end