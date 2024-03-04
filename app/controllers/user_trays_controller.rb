class UserTraysController < ApplicationController
    before_action :set_user
    before_action :set_user_tray, only: [:show, :update, :destroy]

    def index
        user_trays = @user.user_trays
        render json: user_trays, status: :ok
    end
    
    def show
        render json: @user_tray, status: :ok
    end
    
    def create
        user_tray = @user.user_trays.new(user_tray_params)
    
        if user_tray.save
          render json: user_tray, status: :ok
        else
          render json: { error: "User tray creation failed" }, status: :unprocessable_entity
        end
    end
    
    def update
        if @user_tray.update(user_tray_params)
          render json: @user_tray, status: :ok
        else
          render json: { error: "User tray update failed" }, status: :unprocessable_entity
        end
    end
    
    def destroy
        if @user_tray.destroy
          render json: nil, status: :ok
        else
          render json: @user_tray.errors, status: :unprocessable_entity
        end
    end
    
    private

    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_tray
      @user_tray = @user.user_trays.find(params[:id])
    end
  
    def user_tray_params
      params.permit(:tray_id, :seed_map)
    end
  end
end
