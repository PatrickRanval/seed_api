class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def create
    user = User.new(user_params)
    if user.save
      render json: UserBlueprint.render(user, view: :normal), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: "Some kinda fail" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: nil, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
