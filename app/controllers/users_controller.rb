class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def create
    result = UserService::Base.create_user(user_params)

    if result.success?
      render_success(payload: UserBlueprint.render_as_hash(result.payload, view: :normal), status: :created)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def show
    result = UserService::Base.show_user(@user)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def update
    result = UserService::Base.update_user(@user, user_params)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    result = UserService::Base.destroy_user(@user)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
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

