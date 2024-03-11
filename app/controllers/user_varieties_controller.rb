class UserVarietiesController < ApplicationController
  before_action :set_user
  before_action :set_user_variety, only: [:show, :update, :destroy]

  def index
      user_varieties = @user.user_varieties
      render json: user_varieties, status: :ok
  end
  
  def show
      render json: @user_variety, status: :ok
  end
  
  def create
      user_variety = @user.user_varieties.new(user_variety_params)
  
      if user_variety.save
        render json: user_variety, status: :ok
      else
        render json: { error: "User variety creation failed" }, status: :unprocessable_entity
      end
  end
  
  def update
      if @user_variety.update(user_variety_params)
        render json: @user_variety, status: :ok
      else
        render json: { error: "User variety update failed" }, status: :unprocessable_entity
      end
  end
  
  def destroy
      if @user_variety.destroy
        render json: nil, status: :ok
      else
        render json: @user_variety.errors, status: :unprocessable_entity
      end
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_variety
    @user_variety = @user.user_varieties.find(params[:id])
  end

  def user_variety_params
    params.permit(:variety_id, :seed_map)
  end
end

