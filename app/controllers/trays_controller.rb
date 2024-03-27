class TraysController < ApplicationController
  before_action :set_tray, only: [:show, :update, :destroy]

  def index
    trays = Tray.all
    render json: trays, status: :ok
  end

  def show
    result = TrayService::Base.show_tray(@tray)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def create
    result = TrayService::Base.create_tray(tray_params)

    if result.success?
      render_success(payload: result.payload, status: :created)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def update
    result = TrayService::Base.update_tray(@tray, tray_params)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    result = TrayService::Base.destroy_tray(@tray)

    if result.success?
      render_success(payload: result.payload, status: :ok)
    else
      render_error(errors: result.errors, status: :unprocessable_entity)
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
